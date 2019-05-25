require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/peeps' do
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps/new' do
    Peep.send(message: params[:message])

    redirect('/peeps')
  end

  run! if app_file == $0
end
