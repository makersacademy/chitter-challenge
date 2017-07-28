ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class CHITTER < Sinatra::Base

  get '/' do
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :'/posts/index'
  end

  post '/posts' do
    post = Post.new(text: params[:text])
    post.save
    redirect '/posts'
  end

  get '/posts/new' do
    erb :'/posts/new'
  end

  get '/stylesheets/style.css' do
    scss :style
  end

  run! if app_file == $PROGRAM_NAME
end
