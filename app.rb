require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/chitter' do
    @peeps = Peeps.all
    erb :chitter
  end

  post '/chitter' do
    Peeps.add(body: params['post'])
    redirect '/chitter'
  end

<<<<<<< HEAD
  run! if app_file == $0
end
=======
    run! if app_file == $0
end
>>>>>>> dab571213c8f9abdec2809f7e4d02f6c10cfe18e
