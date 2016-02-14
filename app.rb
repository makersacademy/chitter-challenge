ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './models/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/peeps/add' do
    erb(:add)
  end

  post '/peeps/added' do
    peep = Peep.create(peep: params['peep_message'])
    peep.save
    redirect '/peeps/confirmed'
  end

  get '/peeps/confirmed' do
    erb(:confirmation)
  end

  get '/peeps/wall' do
    @peeps = Peep.all
    erb(:wall)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
