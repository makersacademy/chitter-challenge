require 'sinatra'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peep = session[:peep]
    erb(:index)
  end

  post '/post_peep' do
    session[:peep] = params[:message]
    redirect '/'
  end
end
