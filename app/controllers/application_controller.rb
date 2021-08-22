require 'dotenv/load'
require 'active_record'
require 'sinatra'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  configure do
    enable :sessions

    set :method_override, true
    set :public_folder, 'public'
    set :views, 'app/views'
    
    config = YAML::safe_load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(config['test'])
  end

  before do
    @current_user = session[:current_user]
    @users = User.all
  end

  get '/' do
    erb :index
  end

  run! if app_file == $0
end
