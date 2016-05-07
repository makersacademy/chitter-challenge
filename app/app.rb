require 'sinatra/base'
require_relative './models/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Hello world!'
  end

  get '/peeps' do
  	@peeps = Peep.all.reverse
  	erb :'peeps/index'
  end

  get '/peeps/new' do
  	erb :'peeps/new'
  end

  post '/peeps' do
  	Peep.create(content: params[:content], time: Time.now)
  	redirect '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end