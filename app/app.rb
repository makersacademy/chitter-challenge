require 'tilt/erb'
require 'sinatra/base'
require 'sinatra/flash'

require './app/dm_models_setup'

class Chitter < Sinatra::Base
  enable :sessions
  #session secret
  register Sinatra::Flash


  get '/' do
    redirect '/peeps'
  end

  get '/signup' do
    flash.next[:register_user] = true
    redirect '/peeps'
  end

  post '/signup' do
    unless params[:password] == params[:confirm]
      flash.next[:pass_mismatch] = true
      flash.next[:register_user] = true
      redirect '/peeps'
    end
    user = User.create(username: params[:username] , pass: params[:password], email: params[:email])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  post '/login' do
    user_id = User.login params[:username] , params[:password]
    if user_id.nil?
      flash.next[:wrong_login] = true
    else
      session[:user_id] = user_id
    end
    redirect '/peeps'
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
