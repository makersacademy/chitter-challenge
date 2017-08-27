ENV["RACK_ENV"] ||= "development"
require_relative './models/data_mapper_setup.rb'
require 'sinatra/base'
require './models/post.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/home' do
    @posts = Post.all
    erb :home
  end

  post '/home' do
    redirect to ('/new_post')
  end

end
