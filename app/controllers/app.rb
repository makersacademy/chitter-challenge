require 'sinatra/base'
require './app/models/peep'

class Shitter < Sinatra::Base

  # before do
  #   @game = Game.instance
  # end

  configure do
    set :views, "app/views"
    set :public_dir, "public"
  end

  get '/' do
    erb :index
  end

end
