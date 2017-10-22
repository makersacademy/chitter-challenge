ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/models/peep'
require_relative 'data_mapper_setup'
require 'date'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do

    @peeps = Peep.all

    erb :'peeps/index'
  end

  get '/peeps/new' do

    erb :'peeps/new'
  end

  post '/peeps/message' do
    Peep.create(message: params[:message_input])

    redirect('/')
  end
end
