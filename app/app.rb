ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require './models/data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/posts'
  end

  get '/posts/new' do
    erb(:new_post)
  end

  post '/posts' do
    Post.create(title: params[:title], body: params[:body])
    # session[:title] = params[:title]
    # session[:body] = params[:body]
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    # @title = session[:title]
    # @post = session[:body]
    erb(:posts)
  end

end
