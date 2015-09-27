require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/feed' do
    @peeps = Peep.all
    erb :feed
  end

  get '/feed/new' do 
    erb :new_peep
  end

  post '/feed' do 
    Peep.create(message: params[:message])
    redirect to('/feed')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
