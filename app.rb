require "sinatra/base"
require "sinatra/flash"
require "uri"
require "./lib/peep"
require "./lib/database_connection_setup"

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  
  get "/" do
    "Chitter"
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get "/peeps/new" do
    erb :"peeps/new"
  end

  post "/peeps" do
    # flash[:notice] = "You cannot submit an empty peep." unless 
    Peep.create(text: params[:text], name: params[:name])
    redirect "/peeps"
  end

  delete "/peeps/:id" do
    Peep.delete(id: params[:id])
    redirect "/peeps"
  end

  get "/peeps/:id/edit" do
    @peep = Peep.find(id: params[:id])
    erb :"peeps/edit"
  end

  patch "/peeps/:id" do
    Peep.update(id: params[:id], name: params[:name], text: params[:text])
    redirect("/peeps")
  end

  run! if app_file == $0
end