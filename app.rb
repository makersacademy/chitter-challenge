require "sinatra"
require "sinatra/activerecord"
require "./config/environments" #database configuration
require "./models/peep"
require "./models/maker"

get "/" do
  erb :index
end

post "/user-in" do
  @maker = Maker.login(params[:username], params[:password])
  redirect "/peeps"
end

get "/peeps" do
  @peeps = Peep.all
  erb :peeps
end

post "/post-peep" do
  @peep = Peep.write(params[:content], params[:maker_id])
  redirect "/peeps"
end

get "/why" do
  erb :why
end
