require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  # enable :sessions, static
  # set :sessions_secret, 'super secret'
  # set :public_folder, Proc.new { File.join(root, '..', 'public') }

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

end
