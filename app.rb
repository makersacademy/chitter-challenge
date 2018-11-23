require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect(:peep_feed)
  end

  get '/peep_feed' do
  	erb(:peep_feed)
  end

  run! if app_file == $0
end