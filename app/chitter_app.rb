ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative '../setup'
require_relative '../lib/peep_deck'

class ChitterApp < Sinatra::Base

get "/" do
  @peep_deck = PeepDeck.new.display(Peep)
  erb :index
end

post "/send_peep" do
  Peep.create(message: params[:message])
  redirect "/"
end

run! if app_file == $0

end
