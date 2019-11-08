require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    ENV
    @peeps = Peep.all
    erb(:peeps)
  end

  get '/peeps/new' do
    erb(:"peeps/new")
  end

  post '/peeps' do
    Peep.add(peep: params['peep'])
    redirect '/peeps'
  end



  run! if app_file == $0
end
