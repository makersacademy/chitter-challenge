require 'sinatra/base'
require './lib/peep.rb'
# require_relative 'database_connection'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    "Welcome to chitter! Peep peep!"
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps/new' do
    Peep.create(peep: params[:peep])
    redirect '/peeps/new'
  end


  run! if app_file == $0
end
