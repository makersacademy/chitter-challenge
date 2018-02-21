require 'sinatra/base'
require 'sinatra/flash'
require './lib/database_connection_setup'
require './lib/peep'
require './lib/user'
require './lib/comment'
require './lib/flash'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect ('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    @comments = Comment.all
    erb(:'peeps/index')
  end

  post '/peeps/new' do
    user = User.find_user_by_id(session[:user_id])
    redirect '/peeps' if Peep.create(params[:text], user.username)
    params[:text].chars.length > 240 ? flash[:n] = Flash.long_peep : flash[:n] = Flash.no_name
    redirect '/peeps'
  end

  get '/users/new' do
    @peeps = Peep.all
    @comments = Comment.all
    @new_user = true
    erb(:'peeps/index')
  end

  post '/users/new' do
    flash[:n] = Flash.welcome(params[:username])
    redirect '/peeps' if User.create(nil, params[:email], params[:password], params[:name], params[:username])
    flash[:n] = Flash.email_in_use if User.email_in_use?(params[:email])
    flash[:n] = Flash.username_in_use if User.username_in_use?(params[:username])
    flash[:n] = Flash.too_short if !User.valid?(params[:username], params[:name], params[:password])
    redirect '/users/new'
  end

  get '/sessions/new' do
    @peeps = Peep.all
    @comments = Comment.all
    @log_in = true
    erb(:'peeps/index')
  end  

  post '/sessions/new' do
    flash[:n] = Flash.no_match
    redirect '/sessions/new' if !User.matching_data(params[:username], params[:password])
    user = User.instanciate(params[:username])
    session[:user_id] = user.id
    flash[:n] = Flash.after_log_in(params[:username])
    redirect '/peeps'
  end

  get '/sessions/destroy' do
    session.clear
    flash[:n] = Flash.after_log_out
    redirect ('/peeps')
  end

  get '/comments/new' do
    @peeps = Peep.all
    @comments = Comment.all
    @comment = true
    erb(:'peeps/index')
  end

  post '/comments/new' do
    flash[:n] = Flash.thanks_for_comment
    redirect '/peeps' if Comment.add(params[:comment], params[:id])
    flash[:n] = Flash.no_id if !Comment.is_id?(params[:id])
    redirect '/comments/new'
  end

end
