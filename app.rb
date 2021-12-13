require 'sinatra'
require './lib/chitter_model'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/chitter/homepage'
  end

  get '/chitter' do
    redirect '/'
  end

  get '/chitter/homepage' do
    erb :'/homepage'
  end

  get '/chitter/view' do
    @chitts = Chitter_Model.all
    erb :'/view'
  end

  get '/chitter/login' do
    erb :'/login'
  end

  get '/chitter/post' do
    if Chitter_Model.username == nil
      erb :'/not_logged_in'
    else
      erb :'/post'
    end
  end

  post '/chitter/validation' do
    @valid = Chitter_Model.validation(username: params[:username],password: params[:password])
    if @valid == true 
      @username = params[:username]
      redirect '/chitter/successful_login'
    else
      redirect 'chitter/unsuccessful_login'
    end
  end

  get '/chitter/successful_login' do
    erb :'/successful_login'
  end

  get '/chitter/unsuccessful_login' do
    erb :'/unsuccessful_login'
  end

  post '/chitter/posting' do
    Chitter_Model.create(username: Chitter_Model.username,chitt: params[:chitt],time: Time.now)
    redirect '/'
  end

  get '/chitter/create_account' do
    erb :'/create_account'
  end

  post '/chitter/account_creation' do
    created = Chitter_Model.create_account(name: params[:name], username: params[:username],
                                password: params[:password],email: params[:email], created_on: Time.now)
    if created == true
        redirect '/chitter/successful_creation'
    else
      redirect '/chitter/unsuccessful_creation'
    end
  end

  get '/chitter/logout' do
    Chitter_Model.logout
    erb :'/logout'
  end

  get '/chitter/successful_creation' do
    erb :'/successful_creation'
  end

  get '/chitter/unsuccessful_creation' do
    erb :'/unsuccessful_creation'
  end
end
