require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :new_peep
  end

  post '/peep_post' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :peeps
  end
  run! if app_file == $0
end
