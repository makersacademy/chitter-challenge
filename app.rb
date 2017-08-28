ENV["RACK_ENV"] ||= "development"

require_relative 'models/data_mapper_setup.rb'
require 'sinatra/base'
require_relative 'models/post.rb'

class Chitter < Sinatra::Base

  # enable :sessions

  get '/home' do
    @posts = Post.all
    erb :home
  end

  # post '/home' do
  #   redirect to ('/new_post')
  # end

  get '/new_post' do
    erb :new_post
  end

  post '/home' do
     post = Post.create(title: params[:title], chit: params[:chit])
     post.save
     redirect to ('/home')
  end

end
