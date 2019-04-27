require 'sinatra/base'
require 'sinatra/activerecord'
require './models/post.rb'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    erb :home
  end

  post '/post' do
    @post = Post.create(params[:content])
    redirect '/'
  end

  run! if app_file == $0

end
