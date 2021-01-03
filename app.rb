require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :homepage
  end

  post '/peeplist' do
    session[:peep] = params[:peep]
    redirect '/peeplist'
  end

  get '/peeplist' do
    @peep = session[:peep]
    erb :peeplist
  end

end
