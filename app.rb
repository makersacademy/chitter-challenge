require 'sinatra/base'
require_relative 'lib/message'

class Chitter < Sinatra::Base

  get '/' do
    erb :'index'
  end

  post '/message' do
    p params
    @message = params[:message]
    puts params
    erb :'index'
  end

  run! if app_file == $0

end

# post '/names' do
#   p params
#   player1 = Player.new(params[:Player1])
#   player2 = Player.new(params[:Player2])
#   Game.create(player1, player2)
#   redirect '/play'
# end
