class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  set :public_folder, proc { File.join(root, 'static') }
  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def can_save(peep)
      if peep.save
        redirect '/'
      else
        flash.now[:errors] = peep.errors.full_messages
        erb :'peeps/new'
      end
    end
  end
end
