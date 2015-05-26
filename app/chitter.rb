require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require 'byebug'

require_relative 'models/user'
require_relative 'models/peep'
require_relative 'data_mapper_setup'

require_relative 'controllers/base'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'

module Chitter

  class Application < Sinatra::Application

    enable :sessions
    set :session_secret, 'super secret'
    use Rack::Flash
    use Rack::MethodOverride # What does this do?

    use Routes::Users
    use Routes::Sessions
    use Routes::Peeps

    set :partial_template_engine, :erb
    set :views, proc { File.join('app', 'views') }
    set :public_folder, proc { File.join('public') }

    get '/' do
      # Sort peeps in reverse chronological order
      @peeps = Peep.all(order: [:time.desc])
      erb :index
    end

    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end

  end

end
