require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'datamapper_setup'

require_relative 'controllers/base'
require_relative 'controllers/peeps'

require_relative 'models/peep'

module Chitter
  class Application < Sinatra::Application
    enable :sessions
    set :session_secret, 'super secret'
    use Rack::Flash 
    use Rack::MethodOverride

    use Routes::Base
    use Routes::Peeps

    set :partial_template_engine, :erb
    set :views, Proc.new { File.join('app', 'views') }
    # set :public, Proc.new { File.join('app','public') }
  end
end