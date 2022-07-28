require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/post'
require_relative './lib/user'

class Chitter < Sinatra::Base
  configure :test do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @current_user = session['user']
    @posts = Post.all.reverse
    erb(:index)
  end

  post '/new_post' do
    Post.create(username: session['user'].name, content: params[:message], posted_at: Time.now)
    redirect '/'
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up/new_user' do
    session['user'] = User.create(name: params[:user], email: params[:email], password: params[:password])
    redirect '/'
  end

  run! if app_file == $0

end
