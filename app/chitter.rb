ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/sessions'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peep' do
    erb :index
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peep/new' do
    p params[:peep]
    redirect '/peep'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
