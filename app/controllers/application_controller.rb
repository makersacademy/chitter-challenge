require 'dotenv/load'
require 'sinatra'

class ApplicationController < Sinatra::Base
  configure do
    enable :sessions

    set :method_override, true
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    'Hello World!'
  end

  run! if app_file == $0
end
