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
  end

  run! if app_file == $0
  

end