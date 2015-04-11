require 'sinatra/base'
require 'data_mapper'
require './lib/post'
require './lib/tag'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  get '/' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    peep = params["peep"]
    user = params["user"]
    tags = params["tags"].split(" ").map { |tag| Tag.first_or_create(text: tag) }
    Post.create(peep: peep, user: user, tags: tags)
    redirect to('/')
  end

  get '/tags/:text' do
    tag = Tag.first(text: params[:text])
    @posts = tag ? tag.posts : []
    erb :index
  end

  run! if app_file == Chitter

end
