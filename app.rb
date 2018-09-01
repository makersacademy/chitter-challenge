require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Testing infrastructure'
  end

  get '/peep_feed' do
    @peep = sessions[:peep]
    erb :peep_feed
  end

  get '/post_peep' do
    erb :post_peep
  end

  post '/post_peep' do
    session[:peep] = params[:peep_field]
  end

  run! if app_file == $0
end
