
require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/chit'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # get '/' do
  #   # erb :index
  #   redirect '/chits'
  # end

  get '/' do
    @chits = Chit.all
    erb :index
  end

  get '/post_chit' do
    erb :post_chit
  end

  post '/post_chit' do
    Chit.post(handle: params[:handle], content: params[:chit])
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up_confirmation' do
    redirect '/sign_up_confirmation'
  end

  get '/sign_up_confirmation' do
    "You're all signed up! Let's start chatting chit!"
  end

  run! if app_file == $0
end
