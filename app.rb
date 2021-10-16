require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  p "$2a$12$K0ByB.6YI2/OYrB4fQOYLe6Tv0datUVf6VZ/2Jzwm879BW5K1cHey".length
  get '/' do
    @user = User.find(id: session[:user]) if session[:user]
    @peeps = Peep.all
    @signup = params[:signup]
    erb :index, :layout => :base
  end

  get '/user/new' do
    erb :'user/new', :layout => :base
  end

  post '/user' do
    @user = User.create(username: params[:username], email: params[:email],
    first_name: params[:first_name], last_name: params[:last_name], password: params[:password])
    session[:user] = @user.id
    redirect("/?signup=true")
  end

  #halt erb(:error) for later use

  post '/peep/new' do
    text = params[:peep_text]
    Peep.create(text: text)
    redirect('/')
  end

  run! if app_file == $0
end
