ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/post'

# :nodoc:
class Fitter < Sinatra::Base
  get '/' do
    redirect '/posts'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    post = Post.new(tip: params[:tip])
    post.save
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  run! if app_file == $PROGRAM_NAME
end
