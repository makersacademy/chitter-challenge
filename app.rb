require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    "Hello world!"
  end

  get '/new_user' do
    erb :new_user
  end

  post '/users' do
    user = User.create(params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/post_peep' do
    erb :post_peep
  end

  post '/new_peep' do
    Peep.create(params[:new_peep], 1)
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :peeps
  end
end