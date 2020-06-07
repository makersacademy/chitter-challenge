require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/sign_up' do
    $username = params[:username]
    $password = params[:password]
    erb :sign_up
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    @peeps = Peep.all.reverse
    erb :peeps
  end

  run! if app_file == $0
end
