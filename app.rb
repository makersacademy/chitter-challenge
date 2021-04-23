require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'sinatra/activerecord'
require_relative './lib/post.rb'

set :database_file, 'config/database.yml'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    @recent_posts = Post.last(10).reverse
    erb :index
  end

  get '/new_post' do
    erb :new_post
  end

  post '/new_post' do
    Post.create(username: 'Test', name: 'Test', message: params[:new_post])
    redirect '/'
  end
end
