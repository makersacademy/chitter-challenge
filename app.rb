require 'sinatra/base'
require './lib/details.rb'
require './lib/post.rb'
require 'pg'


class Chitter < Sinatra::Base
  enable :sessions
  # set :session_secret, ENV['SESSION_SECRET']

  before do
    @details = Details.all
    @posts = Post.all
  end

  get '/' do
      erb :index
  end

  get '/home' do
      @username = session[:username]
      @name = session[:name]
      erb :home
  end

  post '/home' do
    Details.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:username] = params[:username]
    session[:name] = params[:name]
    redirect '/home'
  end

  post '/new_peep' do
    @name = session[:name]
    @username = session[:username]
    session[:content] = params[:peep_post]
    Post.create(name: @name, username: @username, content: session[:content])
    redirect '/home'
  end

  get '/signup' do
      erb :signup
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  run! if app_file == $0
end
