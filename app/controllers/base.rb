 module App
 	module Routes
 		class Base < Sinatra::Base

            enable :sessions
            register Sinatra::Flash
            use Rack::MethodOverride
            set :sessions_secret, 'super secret'
            set :views, proc { File.join(root, '..', 'views')}
            run! if app_file == $0

            helpers do
            	def current_user 
            		current_user = User.get(session[:user_id])
            	end
            end
        end
    end
end

