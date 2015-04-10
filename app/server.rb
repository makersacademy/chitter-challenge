require 'sinatra/base'
require 'data_mapper'
require_relative 'data_mapper_setup'
require_relative 'models/convo'
require_relative 'models/user'
require_relative 'models/tag'
require 'byebug'

class Chitter < Sinatra::Base

  get '/' do
    @convos = Convo.all
    erb :home
  end

  post '/message' do
    title = params['title']
    message = params['message']
    tags = params['tags'].split(' ').map do |tag|
      Tag.first_or_create(text: tag)
    end
    Convo.create( message: message, tags: tags)
    redirect to ('/')
  end

  get '/tags/:text' do
    tag = Tag.first(text: params[:text])
    @convos = tag ? tag.convo : []
    erb :home
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
