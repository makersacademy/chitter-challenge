require 'sinatra/base'
require './lib/peep'
require './lib/maker'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get "/peeps" do
    @maker = Maker.find(id: session[:maker_id])
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get "/peeps/new" do
    erb :"peeps/new"
  end

  post "/peeps/new" do
    Peep.create(content: params[:content])
    redirect "/peeps"
  end

  get "/makers/new" do
    erb :"makers/new"
  end

  post "/makers" do
    maker = Maker.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
      )
    session[:maker_id] = maker.id
    redirect "/peeps"
  end

  run! if app_file == $0
end
