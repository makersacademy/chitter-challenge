require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(
      :name => params[:name],
      :username => params[:username],
      :email => params[:email],
      :password => params[:password]
    )
    if user.save
      session[:current_user_id] = user.id
      redirect '/users/welcome'
    else
      flash.now[:errors] = user.errors
      erb :"users/new"
    end
  end

  get '/users/welcome' do
    erb :"users/welcome"
  end
end
