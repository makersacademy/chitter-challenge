require 'sinatra/base'
require './lib/peeper'

class Chitter < Sinatra::Base

  get '/' do
    p @peeps = Peeper.all
    erb :home
  end

  post '/peeps' do
    Peeper.post(new_peep: params[:postbox])
    redirect('/')
  end

  run! if app_file == $0

end
