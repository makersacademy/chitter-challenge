require 'sinatra/base'
require 'data_mapper'
env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/post'
require './lib/tag'
require './lib/user'

DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    peep = params["peep"]
    user = params["user"]
    tags = params["tags"].split(" ").map do |tag|
      Tag.first_or_create(text: tag)
    end
    Post.create(peep: peep, user: user, tags: tags)
    redirect to('/')
  end

  get '/tags/:text' do
    tag = Tag.first(text: params[:text])
    @posts = tag ? tag.posts : []
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/')
  end

  helpers do

    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end

  end

  run! if app_file == Chitter

end
