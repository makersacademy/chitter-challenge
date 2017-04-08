require 'sinatra/base'
require_relative 'models/nom'

class NomDiaries < Sinatra::Base

  get '/noms' do
    @noms = Nom.all
    erb :'/noms/index'
  end

end
