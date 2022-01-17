require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/peeps' do
    @peep = session[:peep]
    erb(:peeps)
  end

  post '/peeps' do
    session[:peep] = params[:peep]
    redirect '/peeps'
  end
end
