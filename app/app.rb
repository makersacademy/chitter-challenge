ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require "./app/models/cheep"

class Chitter < Sinatra::Base
  enable :sessions
  get "/" do
    "Hello world"
  end

  get "/cheeps/new" do
    erb :new_cheep
  end

  post "/cheeps/new" do
    Cheep.create(:message => params[:cheep])
    redirect 'cheeps/new'
  end

  get "/cheeps" do
    @cheeps = Cheep.all(:order => [:created_at.desc])
    erb :cheeps
  end

end
