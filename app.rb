require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/user.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  before do
    @user = User.instance
  end

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/registration' do
    @user = User.create(params[:name], params[:email], params[:username], params[:password])
    redirect '/registration'
  end

  get '/registration' do
    erb :registration
  end

  get '/feed' do
    erb :feed
  end

  post '/sign_in' do
    if params[:email] == @user.email
      if params[:password] == @user.password
        redirect '/feed'
      else
        redirect '/incorrect_password'
      end
    else
      redirect '/incorrect_username'
    end
  end

  get '/incorrect_username' do
    erb :incorrect_username
  end

  get '/incorrect_password' do
    erb :incorrect_password
  end


  run! if app_file == $0
  

end