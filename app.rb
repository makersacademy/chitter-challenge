require 'sinatra/base'
require './data_mapper_setup'
require 'sinatra'

class Chitter < Sinatra::Base
  get '/feed' do
    @posts = Post.all
    erb :index
  end

  post '/feed' do
    Post.create(
      :tweet => params[:tweet],
      :created_at => params[:created_at]
    )
    redirect '/feed'
  end

  get '/sign-up' do
    @user = User.new
    erb :'/sign-up'
  end

  post '/sign-up' do
    User.create(
      :username => params[:username],
      :password => params[:password],
      :email => params[:email]
    )
    redirect '/sign-up'
  end
end

# run! if app_file == $0
