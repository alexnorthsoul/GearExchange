class AuthCallbacksController < Devise::OmniauthCallbacksController
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
    @user = User.from_omniauth(request.env['omniauth.auth'])

    sign_in_and_redirect @user
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
    @user = User.from_omniauth(request.env['omniauth.auth'])

    sign_in_and_redirect @user
  end

  def vkontakte
  end
end