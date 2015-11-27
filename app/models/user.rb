class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.password = Devise.friendly_token[0,20]

      # TEMP FIX: need login via Facebook twice
      # some facebook users has no email set | can disagree to share it | API doesnt return it
      user.email    = auth.info.email || 'set@your.email'
    end
  end
end
