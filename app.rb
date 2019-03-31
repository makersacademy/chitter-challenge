require 'sinatra/base'
require_relative 'lib/peep'

# controller
class Chitter < Sinatra::Base
  get '/' do
    @peepdeck = Peep.all
    puts @peepdeck
    erb :index
  end

  get '/message/new' do
    erb :compose
  end

  post '/message/new' do
    Peep.create(peep: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
