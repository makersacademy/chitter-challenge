ENV['RACK_ENV'] ||= 'development'

require "sinatra/base"
require "./app/data_mapper_setup"

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'my_secret'

  get "/" do
    redirect "/peeps"
  end

  get "/peeps" do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :index
  end

  get "/peeps/new" do
    erb :new_peep
  end

  get "/session/new" do
    erb :sign_in
  end

  get "/user/new" do
    erb :sign_up
  end

  post '/session' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect "/peeps"
    else
      redirect "/session/new"
    end
  end

  post "/save_peep" do
    message = params[:peep]
    current_user.peeps << Peep.create(message: message)
    current_user.save
    redirect "/"
  end

  post "/sign_up_confirmation" do
    name = params[:name]
    username = params[:username]
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    user = User.create(name: name, username: username, email: email, password: password, password_confirmation: password_confirmation)
    session[:user_id] = user.id
    redirect "/"
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
