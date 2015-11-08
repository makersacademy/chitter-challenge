ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'models/init'
require_relative 'controllers/init'

class ChitterApp < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial

  use Rack::MethodOverride

  set :views, Proc.new { File.join(root, "../views") }
  set :partial_template_engine, :erb
  set :session_secret, 'thelizardfluwillgetyou'

  enable :sessions
  enable :partial_underscores

  get '/' do
    redirect '/users/new'
  end

  run! if app_file == $0
end
