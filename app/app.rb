require 'sinatra/base'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  ENV['RACK_ENV'] = 'development'
  get '/' do
    'Welcome'
  end

  get '/posts' do
    @posts = Post.all.reverse
    erb(:posts)
  end

  get '/posts/new' do
    erb(:new_post)
  end

  post '/posts' do
    Post.create(message: params[:message])
    redirect '/posts'
  end
end
