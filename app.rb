require "sinatra/base"
require "./lib/peep"

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get "/" do
    redirect("/homepage")
  end

  get "/homepage" do
    erb(:homepage)
  end

  get "/homepage/postpeep" do
    erb(:postpeep)
  end

  post "/homepage/postpeep" do
    Peep.create(peeptext: params[:peeptext])
  end

  run! if app_file == $0
end
