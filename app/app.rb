ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './models/data_mapper_setup'

class Chitter < Sinatra::Base

  helpers do
    def current_user
      @current_user ||= User.first(username: session[:username])
    end
  end

  enable :sessions

  get '/' do
    redirect '/posts'
  end

  get '/posts/new' do
    erb(:new_post)
  end

  post '/posts' do
    Post.create(title: params[:title], body: params[:body], inception: Time.now)
    # session[:title] = params[:title]
    # session[:body] = params[:body]
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all.reverse
    # @title = session[:title]
    # @post = session[:body]
    erb(:posts)
  end

  get '/signup/new' do
    erb(:sign_up)
  end

  post '/signup' do
    User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    redirect('/posts')
  end
end
