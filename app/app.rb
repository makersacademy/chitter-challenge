ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/database_setup.rb'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all(order: :created_at.desc)
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps/sending_peep' do
    Peep.create(message: params[:peep])
    redirect '/peeps'
  end
end
