require 'sinatra'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb (:index)
  end

  get '/peep' do
    @peep = session[:peeps]
    erb (:peeps)
  end

  post '/peep' do
    session[:peeps] = params[:peeps]
    redirect('/peep')
  end

  run! if app_file == $0

end
