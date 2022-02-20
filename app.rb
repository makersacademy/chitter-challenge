require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/post'

class Chitter < Sinatra::Base
  configure :test do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @message = Post.all
    erb(:index)
  end

  post '/new_post' do
    session[:message] = params[:message]
    redirect '/'
  end

  run! if app_file == $0

end
