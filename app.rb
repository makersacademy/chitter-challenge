require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require './models/user'
require './models/setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/sign/up' do
    erb :'sign/up'
  end

  post '/sign/up' do
    @user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
  end

  run! if app_file == $0
end
