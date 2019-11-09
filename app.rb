require 'sinatra/base'
require 'sinatra/flash'
require './lib/beet'

class Bitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/beets' do
    @beets = Beet.all
    @user_name = session[:first_name]
    erb(:beets)
  end

  get '/new_beet' do
    erb(:new_beet)
  end

  get '/users' do
    erb(:users)
  end

  post '/post_beet' do
    @text = params[:beet_text]
    Beet.add(@text)
    redirect '/beets'
  end

  post '/users/new' do
    session[:first_name] = params[:first_name]
    session[:last_name] = params[:last_name]
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/beets'
  end

  run! if app_file == $0
end