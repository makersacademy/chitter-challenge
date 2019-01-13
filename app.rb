ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './config/data_mapper'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do
    @messages = Message.all
    erb(:index)
  end

  post '/peep' do
    Message.create(:content => params[:message])
    redirect '/'
  end

end
