require 'sinatra/base'
require_relative './lib/post'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @first_name = session[:first_name]
    @last_name = session[:last_name]
    @posts = Post.all
    erb :index
  end

  post '/new_post' do
    Post.create(message: params[:message], created_at: Time.now)
    redirect '/'
  end

  get '/registration' do
    erb :registration
  end

  post '/new_user' do
    session[:first_name] = params[:first_name]
    session[:last_name] = params[:last_name]
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
