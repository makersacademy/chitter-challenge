require "sinatra/base"
require "./lib/peep"
require "./lib/user"

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get "/" do
    p session[:user_id]
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    # p @user
    # p User.find(session[:user_id])
    erb(:index)
  end

  get '/users/new' do
    erb(:"users/new")
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    p user.id
    session[:user_id] = user.id
    p session[:user_id]
    redirect("/")
  end

  post "/posted" do
    Peep.create(message: params["posted_message"])
    redirect("/")
  end

  run! if app_file == $0
end