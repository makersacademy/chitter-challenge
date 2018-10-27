require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/sign_up' do
    User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    redirect '/user/:id'
  end

  get '/user/:id' do
    @users = User.all
    erb :user
  end

  run! if app_file == $0
end
