require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/peeps" do
    @peeps = Peep.all
    @user = User.find(session[:user_id])
    erb :peeps
  end

  post "/new" do
    Peep.create(params[:message])
    redirect "/peeps"
  end

  post "/users" do
    user = User.create(params[:email], params[:password])
    session[:user_id] = user.id
    redirect "/peeps"
  end

  run! if app_file == $0
end
