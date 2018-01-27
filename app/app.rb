ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require "./app/models/cheep"

class Chitter < Sinatra::Base
  enable :sessions
  get "/" do
    "Hello world"
  end

  get "/cheep/new" do
    erb :new_cheep
  end

  post "/cheep/new" do
    Cheep.create(:message => params[:cheep])
    redirect 'cheep/new'
  end

  get "/cheeps" do
    @cheeps = Cheep.all
    erb :cheeps
  end

end
