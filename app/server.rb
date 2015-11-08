class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'Schubert'
  set :partial_template_engine, :erb

  enable :partial_underscores


  helpers do
    def save_entered_details
      @username = params['username']
      @email = params['email']
    end

    def process_errors(new_user)
      errors = new_user.errors
      flash.now[:password_error] = SignupErrorHandler.run(errors, :password_error)
      flash.now[:username_error] = SignupErrorHandler.run(errors, :username_error)
      flash.now[:email_error] = SignupErrorHandler.run(errors, :email_error)
      flash.now[:min_length_error] = SignupErrorHandler.run(errors, :min_length_error)
    end

    def assign_errors
      @password_error = flash[:password_error]
      @username_error = flash[:username_error]
      @email_error = flash[:email_error]
      @length_error = flash[:min_length_error]
    end
  end

end