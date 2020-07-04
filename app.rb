require 'sinatra'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/message' do
    erb :message
  end

  post '/create' do
    Peep.new(user: params[:user], handle: params[:user_handle], message: params[:message])
    redirect '/peep'
  end

  get '/peep' do
    @peeps = Peep.all
    erb :peep
  end

  run! if app_file == $PROGRAM_NAME
end