require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  get '/peeps/add' do
    erb :'peeps/add'
  end

  post '/peeps/new' do
    Peeps.add(peep: params['peep'])
    redirect ('/peeps/view')
  end

  get '/peeps/view' do
    "My first Peep!"
  end

  run! if app_file == $0

end
