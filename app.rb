ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/home' do
    erb :home
  end

  post '/home' do
    Peep.create(message: params[:peep], time: Time.now)
  end

  run! if app_file == $0
end
