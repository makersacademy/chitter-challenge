require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/user.rb'
require './lib/peep.rb'

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
    User.create(params[:name], params[:email], params[:username], params[:password])
    redirect '/registration'
  end

  get '/registration' do
    erb :registration
  end

  get '/feed' do
    if @user == nil
      redirect '/not_signed_in'
    else
      erb :feed
    end
  end

  get '/not_signed_in' do
    erb :sign_in
  end
  
  post '/peep' do
    Peep.create(params[:peep], @user.username)
    redirect '/feed'
  end

  post '/sign_in' do
    @user = User.fetch(params[:email], params[:password])
    if @user == nil
      redirect '/invalid_user'
    else
      redirect '/feed'
    end
  end

  get '/invalid_user' do
    erb :invalid_user
  end

  run! if app_file == $0
  
end