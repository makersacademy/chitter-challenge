require 'sinatra'
require './lib/chitter'

class Chitter < Sinatra::Base

  get '/' do
    redirect('/home')
  end

  get '/home' do
    @peeps = Chitter_home.all
    erb :home
  end




end
