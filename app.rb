require "sinatra/base"
require "./lib/bottle"
require_relative "database_connection_setup"

class Shore < Sinatra::Base
  enable :method_override, :sessions

  get '/' do
    @bottles = Bottle.all
    erb :index
  end



  run! if app_file == $0
end