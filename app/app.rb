ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
# require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :'sign_up'
  end

  get '/sign_up' do
    erb :'sign_up'
  end

  post '/sign_up' do
    erb :'index'
  end




run! if app_file == $0
end
