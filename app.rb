require_relative'./lib/peep'
require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb(:login)
  end

  post '/login' do
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.show_all
    erb(:index)
  end

  post '/add' do
    Peep.add(1, params[:tb_peep])
    redirect('/peeps')
  end
  run! if app_file == $0
end
