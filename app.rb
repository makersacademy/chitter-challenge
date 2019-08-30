require 'sinatra/base'
require './chitter.rb'

class ChitterManager < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

  get '/allpeeps' do
    @chitter = Chitter.all
    erb :allpeeps
  end

  post '/allpeeps' do
    Chitter.peep(@message = params[:message])
    redirect '/allpeeps'
  end

  get '/peep' do
    erb :peep
  end

end
