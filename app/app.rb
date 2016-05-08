ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/models/peep'
require_relative 'data_mapper_setup'
class Chitter < Sinatra::Base

  get '/' do
    redirect '/posts'
  end

  get '/posts' do
    @peeps = Peep.all
    erb :'posts/view_posts'
  end

  post '/posts' do
    Peep.create(title: params[:title], message: params[:message])
    redirect '/posts'
  end

  run! if app_file== $0

end
