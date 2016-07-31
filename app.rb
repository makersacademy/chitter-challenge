ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'bcrypt'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    'Hello chitter!'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    Post.create(title: params[:title], post: params[:post])
    redirect '/posts'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
