ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

  # post '/links' do
  #   link = Link.new(title: params[:title], url: params[:url])
  #   params[:tags].split.each do |tag|
  #     link.tags << Tag.create(name: tag)
  #   end
  #   link.save
  #   redirect('/links')
  # end
  #
  # get '/links' do
  #   @links = Link.all
  #   erb :links
  # end
  #
  # get '/links/new' do
  #   erb :links_new
  # end
  #
  # get '/tags/:name' do
  #   tag = Tag.first(name: params[:name])
  #   @links = tag ? tag.links : []
  #   erb :links
  # end

  # start the server if ruby file executed directly
