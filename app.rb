require "sinatra/base"
require "./database_connection_setup"

class Chitter < Sinatra::Base
  post "/users" do
    @user = User.create(params[:user_name])
    redirect "/users/new/#{@user.id}"
  end

  get "/users/new/:id" do
    @user = User.find(params[:id].to_i)
    erb :'/users/show'
  end

  get "/users/new" do
    erb :'users/new'
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post "/peeps" do
    @user = User.instance
    @peep = Peep.create(message: params[:message], user_id: @user.id)
    redirect "/peeps"
  end

  get "/peeps/new" do
    erb :'peeps/new'
  end

  # establish server if file run directly
  run! if app_file == $0
end
