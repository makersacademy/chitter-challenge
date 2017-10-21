 ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_set_up'

class Chitter < Sinatra::Base

  get '/' do
    @chits = Chit.all
    erb(:index)
  end

  get '/add' do
    erb(:add)
  end

  post '/' do
    Chit.create(words: params[:chit])
    # params[:tag].split.each do |tag|
    #   link.tags << Tag.first_or_create(tag: tag)
    # end
    # link.save
    redirect '/'
  end

  run! if app_file == $0
end
