require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do
    erb :login
  end

  post '/' do
    redirect '/' unless User.sign_in_check(params[:user_em], params[:user_pw])
    @user = User.sign_in(params[:user_em], params[:user_pw])
    redirect '/feed'
  end

  get '/feed' do
    @peeps = Peep.all
    erb :index
  end

  post '/feed' do
    Peep.add(params[:add_peep], User.id)
    redirect '/feed'
  end

  get '/register' do
    erb :user_form
  end

  post '/register' do
    User.add(params[:add_username], params[:add_email], params[:add_password])
    redirect '/'
  end

  post '/follow' do
    p User.follow(params[:user_id])
    p params
    redirect '/feed'
  end

end
