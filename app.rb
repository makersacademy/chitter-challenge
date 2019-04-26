require 'sinatra/base'

class ChitterChallenge < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/peeps' do
    session[:peep] = params[:peep]
    redirect '/peep'
  end

  get '/peep' do
    @peep = session[:peep]
    erb :peeps
  end

  run! if app_file == $0
end
