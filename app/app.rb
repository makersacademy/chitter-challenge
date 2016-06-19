ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/post'

class Chitter < Sinatra::Base

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  post '/posts' do
    Post.create(peep: params[:peep], author: 'Jeff')
    redirect '/posts'
  end

  run! if app_file == $0
end
