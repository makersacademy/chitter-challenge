ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'controllers/init'
require_relative 'models/init'
require_relative 'app_helpers/authentication'
require_relative 'app_helpers/notice_redirections'

class Chitter < Sinatra::Base
  helpers CurrentUser, Redirections
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions

  set :views, Proc.new { File.join(root, "../views") }
  set :public_folder, File.dirname(__FILE__) + '/public'
  set :session_secret, 'super secret'

  get '/' do
    @user = User.all
    @peeps = Peep.all(order: [:time_stamp.desc])
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
