ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './models/peep'

class Chitter < Sinatra::Base
  
	get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb:'peeps/index'
  end

  get '/peeps/new' do
  	erb :'peeps/new'
	end

	post '/peeps' do
  	Peep.create(body: params[:body], title: params[:title])
  	redirect '/peeps'
	end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
