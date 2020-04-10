require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = ['First peep', 'Second peep']
    erb :peeps
  end

  run! if app_file == $0
end
