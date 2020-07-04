require 'sinatra/base'
require './lib/peep.rb'
class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/chitter_board' do
    @peep = Peep.new(@params[:message], @params[:user])
    @peep.add_to_database
    erb :chitter_board
  end

  get '/chitter_board' do
    erb :chitterboard
  end

end