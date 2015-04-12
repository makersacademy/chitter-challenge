require 'sinatra/base'
require 'data_mapper'
require_relative 'lib/hashtag'
require_relative 'lib/post'
require_relative 'lib/user'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require_relative 'lib/post'
require_relative 'lib/hashtag'
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
  get '/' do
   @posts = Post.all
   erb :index
  end

  post '/posting' do
    username = params['username']
    message = params['message']
    hashtag = params['hashtag'].split(' ').map do |hashtag|
    Hashtag.first_or_create(text: hashtag)
    end
    
    Post.create(username: username, message: message, hashtag: hashtag)
    redirect to ('/')
  end

  get '/new' do
    erb :new
  end

  post '/new' do
  User.create(email: params[:email],
              password: params[:password])
  redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
