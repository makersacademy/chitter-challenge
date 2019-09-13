require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  #enable :sessions

  get '/' do
   # @timeline
   @timeline = Peeps.all
   #@peep_message = session[:peep_message]
    erb :index
  end

  get '/add_peep' do
    erb :adding_peep_message
  end

  post '/add_peep' do
    Peeps.add(message: params[:message])
    #session[:peep_message] = params[:message]
    redirect '/'
  end

  run! if app_file == $0
end
