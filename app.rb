require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    erb(:peeps)
  end

  get '/post' do
    erb(:post)
  end

  post '/peeps' do
    Peep.add(peep: params['Peep'])
    redirect '/peeps'
  end



  run! if app_file == $0
end
