ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './models/data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.first(username: session[:username])
    end
  end


  get '/' do
    redirect '/posts'
  end

  get '/posts/new' do
    erb(:new_post)
  end

  post '/posts' do
    Post.create(user: current_user.username, title: params[:title], body: params[:body], inception: Time.now)
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all.reverse
    erb(:posts)
  end

  get '/signup/new' do
    erb(:sign_up)
  end

  post '/signup' do
    user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name], username: params[:username])
    if user.save
      #session[:username] = params[:username]
      redirect('/posts')
    else
      flash.now[:message] = 'Password and confirmation password do not match'
      erb(:sign_up)
    end
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:username] = user.username
      redirect('/posts')
    else
      flash.now[:error] = 'Email or password incorrect'
      erb(:'sessions/new')
    end
  end

end
