require 'sinatra/base'
require 'pg'
class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/feed' do
    session['peep'] = params['peep']
    @peep = session['peep']
    Chitter.new_message(peep: params['peep'])
    redirect('/feed')
  end

  get '/feed' do
    @peep = session['peep']
    erb :show_peep
  end

  run! if app_file == $0
end
