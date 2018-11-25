require 'pg'
require 'uri'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './database_connection_setup'


class Controller < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :home
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    erb :peeps
  end

  run! if app_file == $0
end
