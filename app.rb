require 'sinatra/base'
require './lib/peeper'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peeper.all
    erb :home
  end

  post '/peeps' do
    redirect('/')
  end

  run! if app_file == $0

end
