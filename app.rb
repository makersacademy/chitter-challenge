require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require_relative './lib/posts'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_overide
  register Sinatra::Flash

  get '/' do
    redirect '/homepage'
  end

  get '/homepage' do
    @posts = Posts.all
    erb :homepage
  end

  get '/posts/new' do
    erb :"posts/new"
  end

  post '/posts' do
    Posts.create(content: params[:content])
    redirect '/homepage'
  end

  run if app_file == $0

end
