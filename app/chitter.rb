ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require 'time_ago_in_words'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    "Welcome to Chitter"
  end

  get '/chits' do
    @chits = Chit.all(:order => [ :time.desc ])
    erb :'chits/index'
  end

  get '/chits/new' do
    erb :'chits/new'
  end

  post '/chits' do
    Chit.create(message: params[:message],
               time: Time.now)
    redirect '/chits'
  end

  run! if $PROGRAM_NAME == __FILE__
end
