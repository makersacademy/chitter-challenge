require 'sinatra/base'
require './app/models/peep.rb'

class ApplicationManager < Sinatra::Base

  configure do
    enable :sessions
    set :views, "app/views"
    set :public_dir, "public"
  end

  get '/' do

  end

  get '/posts' do

  end

  run! if app_file == $0
end
