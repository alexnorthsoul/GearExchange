class AuthCallbacksController < Devise::OmniauthCallbacksController
  def auth
    @user    = User.from_omniauth(request.env['omniauth.auth'])

    provider = User.where(email: @user.email).first.try(:provider)

    if @user.invalid? && provider.present?
      @user.errors.add(:provider, "You have already registered via #{provider.capitalize}. PLease use button 'Sign in with #{provider.capitalize}'")

      redirect_to :root,  alert: @user.errors.messages[:provider][0]
    else
      sign_in_and_redirect @user
    end
  end

  # {"provider"=>"facebook",
  #  "uid"=>"842530649194394",
  #  "info"=>
  #      {"name"=>"",
  #       "image"=>""},
  #  "credentials"=>
  #      {"token"=>"",
  #       "expires_at"=>1451062446,
  #       "expires"=>true},
  #  "extra"=>
  #      {"raw_info"=>{ ... }}
  # }
  def facebook
    auth
  end

  # {"provider"=>"github",
  #  "uid"=>"3259181",
  #  "info"=>
  #      {"nickname"=>"",
  #       "email"=>"",
  #       "name"=>nil,
  #       "image"=>"",
  #       "urls"=>{"GitHub"=>"h", "Blog"=>nil}},
  #  "credentials"=>
  #      {"token"=>"", "expires"=>false},
  #  "extra"=>
  #      {"raw_info"=> { ... }}
  # }
  def github
    auth
  end

  def google_oauth2
    auth
  end
end