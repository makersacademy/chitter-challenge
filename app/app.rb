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
    params[:tags].split.each do |tag|
      peep.tags << Tag.create(name: tag)
    end
    peep.save
    redirect '/peeps'
  end

  get '/peeps/new' do
  	erb :'peeps/new'
  end

  get '/tags' do
    tag = Tag.first(name: params[:name])
    @peeps = tag ? tag.peeps : []
    erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end