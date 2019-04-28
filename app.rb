require 'sinatra/base'
require_relative './lib/post'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @posts = Post.all
    @user = User.find(session[:user_id])
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
    user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      user_name: params[:user_name]
    )

    session[:user_id] = user.id
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
