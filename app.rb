require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @user = User.find(id: session[:user_id]) unless session[:user_id].nil?
    erb :index
  end

  get '/add-peep' do
    erb :add_peep
  end

  post '/new-peep' do
    Peep.add(params[:chitter_user], params[:new_chitter_message])
    redirect('/')
  end

  get '/user/signup' do
    erb :signup
  end

  post '/user' do
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect('/')
  end
end
