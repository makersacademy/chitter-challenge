require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:current_user_id] = user.id
      redirect '/users/welcome'
    else
      flash.keep[:errors] = [["Username and/or password do not match our records"]]
      redirect "/sessions/new"
    end
  end

  delete '/sessions' do
    session[:current_user_id] = nil
    flash.keep[:notice] = "See you next time!"
    redirect '/sessions/new'
  end
end 
