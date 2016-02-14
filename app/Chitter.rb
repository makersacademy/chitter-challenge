ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  get '/chitter' do
    erb(:chitter_main_page)
  end

  get '/chitter/signup'do
    erb(:chitter_signup)
  end
  post '/chitter/users'do
    User.create(username: params[:username], email: params[:email], name: params[:name], password: params[:password])
  end

run! if app_file == $0
end
