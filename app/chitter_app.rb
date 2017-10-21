ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative '../setup'

class ChitterApp < Sinatra::Base

get "/" do
  @peep_deck = Peep.any? ? Peep.all : []
  erb :index
end

post "/send_peep" do
  Peep.create(message: params[:message])
  redirect "/"
end

run! if app_file == $0

end
