# ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/homepage' #need our link model

class Chitter < Sinatra::Base

  get '/homepage' do
    #uses datamappers .all method to get all data from this class from database
    @homepage = Homepage.all
    erb :'homepage/index'
  end

  # get 'homepage/new_message' do
  #   erb :'homepage/new_message'
  # end
  #
  # post '/homepage' do
  #   Homepage.create(message: params[:message])
  #   redirect '/homepage'
  # end
end
