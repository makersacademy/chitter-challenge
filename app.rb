$VERBOSE=nil

require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions


get '/' do
  erb :index
end

post '/stored' do
  session[:p1]=params[:username]
  redirect '/logged_in'
end

get '/logged_in' do
  @name = session[:p1]
  erb :logged_in
end




run! if app_file == $0

end
