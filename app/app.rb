ENV['RACK_ENV']||='development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative './models/peep'
require_relative './models/tag'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
  	@peeps = Peep.all
  	erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(content: params[:content], time: Time.new)
    tag = Tag.first_or_create(name: params[:tags])
    peep.tags << tag
    peep.save
    redirect '/peeps'
  end

  get '/peeps/new' do
  	erb :'peeps/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end