require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'datamapper_setup'

require_relative 'controllers/base'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

require_relative 'models/peep'
require_relative 'models/user'

module Chitter
  class Application < Sinatra::Application
    enable :sessions
    set :session_secret, 'super secret'
    use Rack::Flash 
    use Rack::MethodOverride

    set :email_handler, MailgunWrapper.new

    use Routes::Base
    use Routes::Peeps
    use Routes::Sessions 
    use Routes::Users

    set :partial_template_engine, :erb
    set :views, Proc.new { File.join('app', 'views') }
    # set :public, Proc.new { File.join('app','public') }
  end
end