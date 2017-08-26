require 'sinatra/base'
require './models/post'
require 'sinatra'

class Chitter < Sinatra::Base
  get '/feed' do
    @posts = Post.all
    erb :'index'
  end

  post'/feed' do
    Post.create(
      :tweet => params[:tweet],
      :time => params[:time]
    )
    redirect '/feed'
  end
end

#run! if app_file == $0
