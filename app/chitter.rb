ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/data_mapper_setup'
require './app/models/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep], user: params[:user])
    redirect '/peeps'
  end

  get '/peeps' do
    @all_peeps = Peep.all
    erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
