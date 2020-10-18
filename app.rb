require 'sinatra/base'
require './lib/chitter.rb'

class Chitterapp < Sinatra::Base
  get '/' do
    "Welcome to Chitter"    "Please log in"
  end

  get '/peeps/new' do
    erb:'peeps/new'
  end


  get '/peeps' do
    @chitter = Chitter.all
    erb :'peeps/index'
  end


  post '/peeps'do
    Chitter.create(peep: params[:peep])
    redirect '/peeps'
  end



end
