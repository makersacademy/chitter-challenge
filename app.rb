require 'sinatra'
require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @peeps = Peep.all
    p Peep.all
  end

  get '/peep' do
    erb :peep
  end

  post '/peeped' do
    Peep.make_peep(maker: params[:maker], message: params[:message], time: params[:time])
    erb :peeped
  end
  
  
  run! if app_file == $0

end