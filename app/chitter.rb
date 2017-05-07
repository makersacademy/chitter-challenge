ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'helpers'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  helpers Helpers

  get '/' do
    @posts = Post.all
    erb :index
  end

  post '/login' do
    @logged_in_user = User.authenticate(params[:username], params[:password])
    if @logged_in_user != nil
      session[:user_id] = @logged_in_user.id
      redirect to('/')
    else
      flash.now[:notice] = "Sorry, we can't find you. Try again?"
      erb :index
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(name:  params[:name],  username: params[:username],
                email: params[:email], password: params[:password])
      if user.errors.count >= 1
        flash.now[:notice] = "Sorry! " + user.errors.full_messages.join(", ") +
                             " Do you need to <a href='/'>Login?</a>"
        erb :signup
      else
        redirect to('/')
      end
  end

  post '/logout' do
    session.clear
    redirect to('/')
  end

  post '/post' do
    post = Post.create(post: params[:post], user_id: session[:user_id])
    if post.errors.count >= 1
      flash.now[:notice] = "Whoops, something went wrong with your post. <a href='/'>Go back</a>"
      erb :index
    else
      redirect to('/')
    end
  end
end
