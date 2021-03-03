require 'sinatra/base'
require 'sinatra/flash'

require_relative 'user_controller'
require_relative 'peeps_controller'
require_relative 'session_controller'
require_relative '../lib/database_connection'
require_relative '../lib/user'
require_relative '../lib/peep'

class Chitter < Sinatra::Base
  before { @user = User.find(id: session[:user_id]) if session[:user_id] }

  configure do
    register Sinatra::Flash
    enable :sessions, :method_override
    set :root, File.dirname(File.expand_path('..', __FILE__))
    set :public_folder, Proc.new { File.join(root, '../public') }
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    redirect '/peeps'
  end
end
