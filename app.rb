require 'sinatra/base'
require 'sinatra'
require_relative './lib/message'

class ChitterManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :homepage
  end

  get '/register' do
    erb :register
  end

  post '/login' do
    # if Login.succesful?
      session[:username] = params[:username]
    # end
    redirect '/'
  end

  post '/register' do
    User.create(username: params[:username], firstname: params[:firstname], lastname: params[:lastname], email: params[:email], password: params[:password])
    redirect '/'
  end

  post '/post_message' do
    Post.create(content: params[:content], created_at: Time.now, user_id: User.first("#{session[:user]}")[:id])
    redirect '/'
  end

  run! if app_file == $0
end
