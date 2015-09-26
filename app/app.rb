require 'sinatra/base'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  set :views, proc {File.join(root,'..','/app/views')}

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new_peep'
  end

  post '/peeps' do
  Peep.create(message: params[:message])
  redirect '/peeps'
end

run! if app_file == $0
end
