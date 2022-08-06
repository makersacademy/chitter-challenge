
# require 'sinatra/base'
# require 'sinatra/reloader'
require 'pg'
require './lib/chit'
require './lib/user'

# class App < Sinatra::Base
#   configure :development do
#     register Sinatra::Reloader
#   end

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

  post '/sign_up' do
    User.sign_up(full_name: params[:full_name], username: params[:username], handle: params[:handle], email: params[:email], password: params[:password])
    redirect '/sign_up_confirmation'
  end

  get '/sign_up_confirmation' do
    erb :sign_up_confirmation
  end

#   run! if app_file == $0
# end
