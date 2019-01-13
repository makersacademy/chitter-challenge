ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './config/data_mapper'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @messages = Message.all
    erb(:peeps)
  end

  post '/peep' do
    Message.create(:content => params[:message])
    redirect '/peeps'
  end

  post '/signup' do
    redirect '/peeps'
  end

end
