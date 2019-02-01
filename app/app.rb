require 'sinatra'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @new_peep = session['peep']
    erb :'peeps/index'
  end

  post '/peeps' do
    session['peep'] = params['peep']
    redirect '/peeps'
  end

end