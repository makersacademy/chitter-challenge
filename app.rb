require 'sinatra/base'
require_relative './lib/setup_database_connection'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/peep_feed' do
    @peeps = Peep.all
    erb :peep_feed
  end

  get '/peep_feed/new_peep' do
    erb :new_peep
  end

  post '/peep_feed' do
    Peep.create(params[:new_peep])
    redirect '/peep_feed'
  end

  get '/user/new' do
    erb :sign_up
  end

  post '/user' do
    user = User.create(params[:name], params[:username], params[:email], params[:password])
    session[:user] = User.all.find { |user_list| user_list.id == user.id }
    redirect '/peep_feed'
  end

  get '/sessions/new' do
    erb :sign_in
  end

  post '/sessions' do
    session[:user] = User.authenticate(params[:username], params[:password])
    redirect '/peep_feed'
  end
end
