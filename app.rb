require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :homepage
  end

  post '/post-message' do
    params[:message]
    redirect '/'
  end
end