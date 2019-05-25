require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  post '/homepage' do
    session[:peep] = params[:peep]
    redirect :homepage
  end

  get '/homepage' do
    @peep = session[:peep]
    erb :homepage
  end
end
