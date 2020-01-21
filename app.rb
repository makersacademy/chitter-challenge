require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/peeps' do
    @peep = params['message']
    redirect '/peeps'
  end

  get '/peeps' do
    erb :peeps
  end

  run! if app_file == $0
end
