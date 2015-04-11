require 'sinatra/base'
require 'data_mapper'
require './lib/post'

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
    peep = params['peep']
    user = params['user']
    Post.create(peep: peep, user: user)
    redirect to('/')
  end

  run! if app_file == Chitter

end
