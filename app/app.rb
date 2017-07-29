require 'sinatra/base'

class Chitter < Sinatra::Base
enable :sessions


get '/messages' do
  @peep = session[:peep]
  erb :messages
end

post '/messages' do
session[:peep] = params[:peep]
redirect '/messages'
end

run! if app_file == $0
end
