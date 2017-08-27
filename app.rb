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
    # strftime("%A, %d %b %Y %l:%M %p")
    redirect '/feed'
  end
end

# run! if app_file == $0
