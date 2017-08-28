ENV["RACK_ENV"] ||= "development"

require_relative 'models/data_mapper_setup.rb'
require 'sinatra/base'
require_relative 'models/post.rb'
require_relative 'models/user.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/sign_up' do
    # @user = user.all
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(username: params[:username], password: params[:password])
    user.save
  end

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
     post = Post.create(title: params[:title], chit: params[:chit], created_at: [Time.now.strftime("%d %b %Y %l:%M")])
     post.save
     redirect to ('/home')
  end

end
