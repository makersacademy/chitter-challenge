require 'sinatra/base'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  ENV['RACK_ENV'] = 'development'
  get '/' do
    'Welcome'
  end

  get '/posts' do
    @posts = Post.all.reverse
    erb(:posts)
  end
end
