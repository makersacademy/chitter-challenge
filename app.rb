require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peep = Peep.new(session[:peep])
    erb :index
  end

  post '/post-peep' do
    session[:peep] = params[:peep] # initiate new peep with peep object
    redirect('/')
  end

end
