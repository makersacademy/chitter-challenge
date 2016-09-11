class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial

  set :sessions_secret, 'super_secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  get '/' do
    redirect '/feed'
  end

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_name])
      end
    end
end
