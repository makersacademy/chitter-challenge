require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect('/chitter')
  end

  get '/chitter' do
    erb(:index)
  end

end
