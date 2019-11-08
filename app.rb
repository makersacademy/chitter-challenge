require 'sinatra'
require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    #displays the peeps in the order they are made
    @peeps = Peep.all
    erb :chitter
  end

  get '/peep' do
    #takes the maker name, their peep, and the time
    erb :peep
  end

  post '/peeped' do
    #takes all of the info entered in /peep and passes it to /chitter via the Peep class
    Peep.make_peep(maker: params[:maker], message: params[:message], time: params[:time])
    redirect '/chitter'
  end
  
  run! if app_file == $0

end