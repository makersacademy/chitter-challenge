# require_relative 'peep_controller'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user'
require_relative './lib/peep'
require_relative './lib/chitter'

class ChitterApp < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb :'index'
  end

  post '/index' do
    if User.exists?(params[:username], params[:email])
      flash[:sign_up] = "Sorry those details have already been registered, please try again"
      redirect '/'
    else
      User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
      new_user = User.all.select { |user| user.username == params[:username] }.first
      redirect "/welcome/#{new_user.username}"
    end
  end

  post '/welcome' do
    login_user = User.login(params[:email], params[:password])
    redirect "/welcome/#{login_user}"
  end

  get '/welcome/:username' do
    current_user = User.all.select { |user| user.username == params[:username] }.first
    @name = current_user.name
    erb :welcome
  end

  get '/post' do
    erb :post
  end

  post '/post' do
    Peep.create(params[:peep], Time.now)
    flash[:post] = "Peep posted"
    redirect '/post'
  end

  get '/chitter' do
    @peeps = Chitter.all(Peep)
    erb :chitter
  end

  get '/login' do
    erb :login
  end

  run! if app_file == $0
end
