require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'sinatra/flash'
require 'sinatra/base'
require_relative './models/users'
require_relative './models/peeps'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    redirect('/peeps')
  end


  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end

    def current_author
      current_author ||= User.get(session[:author])
    end

  end

  run! if app_file == $0
end

