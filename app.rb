require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/post'
#require_relative './lib/user'

class Chitter < Sinatra::Base
  configure :test do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @posts = Post.all.reverse
    erb(:index)
  end

  post '/peep' do
    Post.create(content: params[:message], posted_at: Time.now)
    redirect '/'
  end

  run! if app_file == $0

end
