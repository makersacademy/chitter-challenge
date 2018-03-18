require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/save' do

  end

  run! if app_file == $0

end
