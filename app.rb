require 'sinatra/base'
require 'sinatra/flash'
require_relative 'controllers/user_authentication'
require_relative 'lib/all_users'
require_relative 'lib/user'

class ChitterApp < Sinatra::Base
  use Rack::Session::Pool

  register Sinatra::Flash

  configure do
    set :users, AllChitterUsers.new
    set :current_user, User.new
  end

  # not_found do
  #   status 404
  #   erb :'404Page'
  # end

  get '/' do
    @current_user = settings.current_user
    erb :index
  end


  run! if app_file == $0
end
