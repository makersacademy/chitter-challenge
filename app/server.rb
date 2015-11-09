class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'rochefort rocks'
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers do

    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def format_time(creation_time)
      Time.parse(creation_time.to_s).ago_in_words
    end

  end

  run! if app_file == $PROGRAM_NAME

end
