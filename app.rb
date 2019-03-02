require_relative './lib/peeps.rb'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    p ENV
    @peepmessage = Peep.all
    erb :index
  end

  get '/yourpeep' do
    erb :createpeep
  end

  post '/' do
    Peep.create(peep: params[:peep])
    redirect '/'
  end

 run! if app_file == $0
end
