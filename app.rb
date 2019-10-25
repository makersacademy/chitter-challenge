require 'sinatra/base'

class ChitterChallenge < Sinatra::Base
  enable :sessions

  get '/' do
    session[:peeps] = [
        "This is my first ever Peep!",
        "This is me saying something inspirational.",
        "I'm upset about politics right now!"
        ]
    @peeps = session[:peeps]
    erb (:peeps)
  end

  get '/new_peep' do
    erb (:new_peep)
  end

  post '/adding_new_peep' do
    p params[:peep]
    new_peep = params[:peep]
    p new_peep
    session[:peeps] << new_peep
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = session[:peeps]
    erb :peeps
  end

  run! if app_file == $0
end
