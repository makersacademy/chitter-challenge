ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/models/data_mapper_setup'
require './app/models/peep'

class Chitter < Sinatra::Base

  get '/posts' do
    @peep = Peep.all
    erb :index
  end

  post '/posts' do
    post = Peep.first_or_create(body_post: params[:body_post], created_at: params[:created_at])
    post.save
    redirect '/posts'
  end

  get 'posts/new' do
    erb :new
  end


run! if app_file == $0

end
