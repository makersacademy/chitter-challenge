require_relative './lib/peeps.rb'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peepmessage = Peep.all
    erb :index
  end

  get '/yourpeep' do
    erb :createpeep
  end

 run! if app_file == $0
end
