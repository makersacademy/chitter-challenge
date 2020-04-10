require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  
  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

<<<<<<< HEAD
  post '/users/new' do
    "wibble"
  end

=======
>>>>>>> 7c44869758a14850f24c57ad74dae9c37bb6ef31
  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
