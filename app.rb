require 'sinatra'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
  end

  run! if app_file == $0
end
