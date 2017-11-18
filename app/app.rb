ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './models/data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  helpers do

  end

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

end
