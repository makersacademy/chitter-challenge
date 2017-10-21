ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative '../setup'
require_relative '../lib/peep_deck'

class ChitterApp < Sinatra::Base

enable :sessions

get "/" do
  @peep_deck = PeepDeck.new.display(Peep)
  @username = session[:username]
  erb :index
end

get "/signup" do
  erb :signup
end

post "/signup" do
  user = User.create(username: params[:username], email: params[:email], password: params[:password])
  session[:username] = user.username
  p session[:username]
  redirect "/"
end

post "/send_peep" do
  Peep.create(message: params[:message])
  redirect "/"
end

run! if app_file == $0

end
