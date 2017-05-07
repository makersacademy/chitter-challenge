require 'sinatra/base'

require_relative 'controllers/users'
require_relative 'models/user'

class Chitter < Sinatra::Base
  set :sessions, true

  get '/' do
    erb(:index)
  end

  post '/users' do
    @user = User.new(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    erb(:'users/welcome')
  end

  get '/users/new' do
    erb(:'users/new')
  end

  get '/login' do
    erb(:login)
  end
end
