require 'sinatra/base'
require 'sinatra/reloader'
require './lib/news_feed'
require './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    User.sign_up(name: params[:name], email: params[:email], password: params[:password], dob: params[:dob])
    redirect('/login')
  end

  get '/login' do
    @credentials = session[:credentials]
    erb(:login)
  end

  post '/login' do
    session[:credentials] = User.log_in(email: params[:email], password: params[:password])
    if @credentials == nil
      redirect('/feed')
    else
      redirect('/login')
    end
  end

  get '/feed' do
    p 'get feed'
    p @peeps = NewsFeed.all
    erb(:feed)
  end

  post '/feed' do
    p 'post feed'
    p NewsFeed.create(name: 'John', message: params[:peep], time: Time.new)
    redirect('/feed')
  end
end