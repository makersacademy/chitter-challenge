require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    redirects to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.new(name:       params[:name],
                    user_name:  params[:user_name],
                    message:    params[:message])
    peep.save
    redirect to '/peeps'
  end

end
