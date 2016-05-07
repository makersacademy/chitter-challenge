require 'sinatra/base'
require_relative 'models/peep'

class ChitterChallenge < Sinatra::Base
  get '/' do
    'Hello ChitterChallenge!'
  end

  get '/peeps' do
  	@peeps = Peep.all
  	erb:'peeps/index'
  end

  post '/peeps' do
  	Peep.create(peep: params[:peep])
  	redirect '/peeps'
  end

  get '/peeps/new' do
  	erb:'peeps/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
