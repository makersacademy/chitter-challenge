ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'peeps/new_peep'
  end

  post '/peeps' do
    new_peep = Peep.create(message: params[:message])
    new_peep.save
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps_index'
  end

  run! if app_file == $0

end
