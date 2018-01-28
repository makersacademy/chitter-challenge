ENV['RACK_ENV'] ||= 'development'

require './app/data_mapper_setup.rb'


require 'sinatra/base'
require 'database_cleaner'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :sign_up
  end

  post '/sign_up' do
  maker = Maker.create(email: params[:email], password: params[:password], name: params[:name], user_name: params[:user_name])
  session[:name] = params[:name]
  session[:user_name] = params[:user_name]
  session[:maker_id] = maker.id
  maker.save
  redirect '/peeps'
end

  run! if app_file == $0
end
