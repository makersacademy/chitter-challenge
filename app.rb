require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/log_in'
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    User.add_new_user(params[:id])
    session[:id] = params[:id]
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.and_id
    @id = session[:id]
    erb :index
  end

  get '/peeps/add_peeps' do
    erb :add_new_peeps
  end

  post '/peeps/add_peeps' do
    redirect '/peeps/add_peeps'
  end

  post '/peeps/create_new_peep' do
    # begin
      Peep.add_new_peep(params[:new_peep], session[:id])
      redirect '/peeps'
    # rescue Exception => error
    #   flash[:notice] = error.message
    # end
    # redirect('/links/add_link')
  end
#
#   post '/links/:id/delete' do
#     Link.delete(params[:id])
#     redirect '/links'
#   end
#
#   post '/links/:id/update' do
#     session[:id] = params[:id]
#     redirect '/links/:id/update'
#   end
#
#   get '/links/:id/update' do
#     @session_id = session[:id]
#     erb :update
#   end
#
#   post '/links/:id/updated' do
#     Link.update(session[:id], params[:update])
#     redirect '/links'
#   end
#
  run! if app_file == $0
end