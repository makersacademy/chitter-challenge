require 'sinatra/base'


class Chitter < Sinatra::Base

  get '/' do
   erb(:index)
  end

  get '/new_peep' do
    erb(:new_peep)
  end

  post '/peeps' do
    redirect('peeps')
  end

  get '/peeps' do
    erb(:peeps)
  end

  run! if app_file == $0


end
