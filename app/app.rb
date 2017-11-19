require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect 'new_peep'
  end

  get '/new_peep' do
    erb :new_peep
  end

  run! if app_file == $0

end
