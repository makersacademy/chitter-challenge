require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  get '/' do
    redirect('/homepage')
  end

  get '/homepage' do
    @peeps = Peep.all
    erb :homepage
  end

  post '/homepage' do
    Peep.create(text: params[:peep])
    redirect('/homepage')
  end

  get '/new-peep' do
    erb :new_peep
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
