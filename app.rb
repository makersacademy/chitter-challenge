require 'sinatra/base'
require_relative './lib/chitter.rb'


class ChitterApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/peep' do
    Chitter.create(params[:new_peep])
    'Peep saved'
  end


  run! if app_file == $0
end