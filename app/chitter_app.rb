ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative '../setup'
require_relative '../lib/peep_deck'

class ChitterApp < Sinatra::Base

attr_reader :current_user

enable :sessions
set :session_secret, 'super secret'

get "/" do
  @peep_deck = PeepDeck.new.display(Peep)
  @username = current_user ? current_user.username : "Stranger"
  erb :index
end

get "/signup" do
  erb :signup
end

post "/signup" do
  user = User.create(username: params[:username], email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect "/"
end

post "/send_peep" do
  Peep.create(message: params[:message])
  redirect "/"
end

get "/sign-in" do
  erb :sign_in
end

post "/sign-in" do
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/"
  else
    @error = "Your email or password is incorrect. Please try again."
    redirect "/sign-in"
  end
end

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

run! if app_file == $0


end
