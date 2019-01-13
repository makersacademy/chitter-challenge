ENV['RACK_ENV'] ||= 'development'

require 'pry'
require 'sinatra/base'
require './config/data_mapper'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(message: params[:message])
    redirect '/'
  end
end  
