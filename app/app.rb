require 'sinatra/base'
require 'sinatra/activerecord'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    erb :home
  end

  post '/post' do
    @post = Post.create(content: params[:content])
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all.order(created_at: :desc)
    erb :post
  end

  run! if app_file == $0

end
