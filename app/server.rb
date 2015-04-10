require 'sinatra/base'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative './models/user'

DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/users' do
    "Welcome #{params[:name].split(" ").first}!"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
