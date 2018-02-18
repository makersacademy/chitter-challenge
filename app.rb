require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'Time'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb (:index)
  end

  post '/add-peep' do 
    Peep.create(content: params[:new_peep],  time: Time.now)
    redirect '/'
  end

  run! if app_file == $0
end