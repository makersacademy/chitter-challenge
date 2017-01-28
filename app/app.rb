ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/sign_up'
  end

  get '/sign_up' do
    erb :sign_up_form
  end

  post '/sign_up' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:username] = params[:username]
    redirect '/main'
  end

  get '/main' do
    @username = session[:username]
    erb :main
  end

  run! if app_file == $0
end
