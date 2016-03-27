require 'tilt/erb'
require 'sinatra/base'
require 'bcrypt'

require './app/dm_models_setup'

class Chitter < Sinatra::Base
  enable :sessions
  #session secret


  get '/' do
    redirect '/peeps'
  end

  get '/signup' do
    erb :signup_page
  end

  post '/signup' do
    #redir get signup if validation = false
    user = User.create(username: params[:username] , password: params[:password], email: params[:email])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  post '/login' do
    declared_user = User.first(username: params[:username])
    raise "nil user" if declared_user.nil?
    session[:user_id] = declared_user.id if declared_user.password == params[:password]
    redirect '/peeps' #+warn if validation = false
  end

  get '/logout' do
    session[:user_id] = nil
    redirect back
  end

  get '/peeps' do
    current_user = User.first(id: session[:user_id])
    @peep_list = Peep.all.sort {|a,b| a.date <=> b.date}
    @signed_in = !current_user.nil?
    if @signed_in
      @user = current_user.username
      @mail = current_user.email
    end
    erb :main_page
  end

  post '/add_peep' do
    raise "not logged in" if session[:user_id].nil?
    text = params[:peep_text] #+warn if size > 200
    new_peep = Peep.create(content: text, date: DateTime.now, user_id: session[:user_id])
    tags = params[:tags].split(',')
    tags.each { |tag| new_peep.tags << Tag.first_or_create(name: tag) }
    new_peep.save
    redirect '/peeps'
  end

  get '/peeps/:tag' do
    tag = Tag.first(name: params[:tag])
    @peep_list = tag.peeps
    @filter_type = 'Tag'
    current_user = User.first(id: session[:user_id])
    @signed_in = !current_user.nil?
    if @signed_in
      @user = current_user.username
      @mail = current_user.email
    end
    erb :main_page
  end

end
