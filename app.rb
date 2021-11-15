require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'
require './lib/account'

class ChitterApp < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/post' do
    erb :post
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/post-tweet' do
    Chitter.create(params[:tweet])
    redirect '/feed'
  end

  post '/post-sign-up' do
    Account.create(username: params[:username], email: params[:email], password: params[:password])
    redirect '/post'
  end

  get '/feed' do
    @chitters = Chitter.all
    erb :feed
  end

  run! if app_file == $0
end
