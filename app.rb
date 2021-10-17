require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative 'database_connection_setup'
require './lib/user'
require './lib/peep'
require './helpers/peeps'
require 'relative_time'
require 'rss'
require 'open-uri'
require './lib/news'

class ChitterApp < Sinatra::Base

  include PeepHelper

  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions, :method_override

  before do
    @news = News.create
  end

  get '/' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all.reverse
    @tags = Tag.all
    
    erb :index
  end

  get '/users/sign_up' do
    erb :"users/sign_up"
  end

  get '/users/sign_in' do
    erb :"users/sign_in"
  end

  post '/sessions' do
    @user = User.authenticate(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/'
    else
      flash[:notice] = 'Please check your username or password.'
      redirect '/users/sign_in'
    end
  end

  post '/users' do
    user = User.create(username: params[:username], email: params[:email], 
password: params[:password], name: params[:name])
    session[:user_id] = user.id
    redirect '/'
  end

  post '/sessions/destroy' do
    session.clear
    redirect '/'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(text: params[:text], user_id: session[:user_id], timestamp: Time.now)
    Tag.hashtag
    redirect '/'
  end

  get '/tags/:id/peeps' do
    @peeps = Peep.tagged(tag_id: params[:id]).reverse
    @user = User.find(session[:user_id])
    @tags = Tag.all
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
