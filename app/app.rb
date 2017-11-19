ENV['RACK_ENV'] ||= 'development'

require './app/models/peep.rb'
require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :session

  get '/newpeep' do
    erb(:newpeep)
  end

  post '/peep' do
    Peep.create(message: params[:message], time: Time.new)
    redirect '/peep'
  end

  get '/peep' do
    @peep = Peep.all
    erb(:peep)
  end
end
