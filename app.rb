require 'sinatra'
require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/peep' do
    erb :peep
  end

  post '/peeped' do
   
    erb :peeped
  end





  run! if app_file == $0

end