ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require './app/models/peep'

class Chitter < Sinatra::Base
  # enable :sessions
  # set :session_secret, 'session'
  # register Sinatra::Flash

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message])
    peep.save
    redirect to('/peeps')
  end


run! if app_file == $0
end
