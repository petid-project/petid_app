# class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

# end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    create
  end

  def google_oauth2
    create
  end

  def instagram
    create
  end

  private

    def create
      auth_params = request.env["omniauth.auth"]
      provider = AuthenticationProvider.where(name: auth_params.provider).first
      authentication = provider.user_authentications.where(uid: auth_params.uid).first
      existing_user = current_user || User.where('email = ?', auth_params['info']['email']).first

      if authentication
        sign_in_with_existing_authentication(authentication)
      elsif existing_user
        create_authentication_and_sign_in(auth_params, existing_user, provider)
      else
        create_user_and_authentication_and_sign_in(auth_params, provider)
      end
    end

    def sign_in_with_existing_authentication(authentication)
      sign_in_and_redirect(:user, authentication.user)
    end

    def create_authentication_and_sign_in(auth_params, user, provider)
      UserAuthentication.create_from_omniauth(auth_params, user, provider)

      sign_in_and_redirect(:user, user)
    end

    def create_user_and_authentication_and_sign_in(auth_params, provider)
      user = User.create_from_omniauth(auth_params)
      if user.valid?
        create_authentication_and_sign_in(auth_params, user, provider)
      else
        flash[:error] = user.errors.full_messages.first
        redirect_to new_user_registration_url
      end
    end
end
