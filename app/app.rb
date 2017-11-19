require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/peep' do
    peep_post = params[:post]
    peep_tags = params[:tags]
    post = Peep.create(name: peep_post)
    peep_tags.split(',').each {|tag| post.tags << Tag.create(name: tag)}
    post.save
    redirect '/peep'
  end

  get '/peep' do
    @peeps = Peep.all
    erb(:peep)
  end

end
