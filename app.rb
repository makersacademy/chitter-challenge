require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup.rb'
require_relative 'lib/peep'
require_relative 'lib/user'

class ChitterApp < Sinatra::Base

  setup_databases

  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Hello world'
  end

  post '/users' do
    string = "Sorry, that email or username has already been used."
    unless user = User.make(email: params["email"], password: params["password"], username: params["username"], name: params["name"])
      flash[:error] = string
      redirect '/users/new'
    else
      redirect "/users/#{user.id}"
    end
  end

  get '/users/new' do
    erb :sign_up
  end

  get '/users/sign_in'do
    erb :sign_in
  end

  post '/users/sign_in' do
    string = "Sorry, either your username or password were incorrect"
    unless user = User.sign_in(username: params[username], password: params[password])
      flash[:error] = string
      redirect '/users/sign_in'
    else
      redirect "/users/#{user.id}"
    end
  end

  get '/users/:id' do
    @user = User.get(params[:id])
    erb :users
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :chitter_homepage
  end

  post '/peeps' do
    Peep.create(text: params["peep"])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :peep
  end

  run! if app_file == $0
end
