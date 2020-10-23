require 'sinatra/base'
require_relative '../lib/peep.rb'
require_relative '../database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do 
    @sorted_peeps = Peep.all.sort_by { |peep| peep.posted_on }.reverse
    erb(:index)
  end

  get '/user/new' do
    erb(:'user/new')
  end

  get '/peep' do
    erb(:'peep/add')
  end

  post '/peep' do
    Peep.create(username: params[:username], body: params[:body])
    # peep = "@#{params[:username]}: #{params[:body]} (#{Time.now.strftime("%Y-%m-%d %H:%M:%S")})"
    redirect('/')
  end

  delete '/peep' do
    Peep.delete(id: params[:peep_id])
    redirect('/')
  end

  # post '/peep/edit' do
  #   @peep_id = params[:peep_id]
  #   @peep_username = params[:peep_username]
  #   @peep_body = params[:peep_body]
  #   erb(:'peep/edit')
  # end

  get '/peep/:id/edit' do
    @peep = Peep.find_by(id: params[:peep_id])
    erb(:'peep/edit')
  end

  put '/peep' do
    Peep.update(id: params[:peep_id], body: params[:body])
    redirect('/')
  end

  run! if app_file == $0
end
