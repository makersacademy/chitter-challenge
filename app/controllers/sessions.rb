require 'sinatra/base'
require 'sinatra/flash'
require_relative '../models/peep'
require_relative '../models/user'
require_relative '../models/tag'
require_relative '../models/reply'

class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.next[:notice] = 'incorrect username or password'
      redirect'sessions/new'
    end
  end

  delete '/sessions' do
    session.delete(:user_id)
    flash.next[:notice] = 'You have signed-out.'
    redirect '/'
  end

end
