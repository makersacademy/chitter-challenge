# require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'sinatra/activerecord'
require 'active_record'
require_relative './models/user.rb'
require_relative './models/peep.rb'
require_relative './models/peep_user_tag.rb'

# ActiveRecord::Base.establish_connection(
#   adapter:  "postgresql",
#   database: ENV['ENVIRONMENT'] == 'test' ? "chitter_test" : "chitter"
# )

class Chitter < Sinatra::Base
  register Sinatra::Reloader
  register Sinatra::Flash
  register Sinatra::ActiveRecordExtension

  enable :method_override
  enable :sessions

  set :public_folder, File.dirname(__FILE__) + '/static'

  get '/' do
    'Hello world.'
  end

  get '/chitter' do
    @user = User.find_by_id(session[:user_id]) if session[:user_id]
    @peeps = Peep.order(created_at: :desc)
    erb(:index)
  end

  # PEEP ROUTES

  # create new peep
  post '/peeps/new' do
    @peep = Peep.new(user_id: session[:user_id], content: params[:content],reply_to_peep_id: params[:reply_to_peep_id])
    @peep.save!
    @peep.process_user_tags
    flash[:peep_created] = true
    redirect('/chitter')
  end


  #reply to a peep
  get '/peeps/:id/reply' do
    @parent_peep = Peep.find_by_id(params[:id])
    erb(:"peeps/reply")
  end



  # User page
  get '/users/profile/:id' do
    @user = User.find(params[:id])
    @peeps = @user.peeps.order(created_at: :desc)
    erb(:"users/profile/index")
  end

  # USER ROUTES new / login
  get '/users/new' do
    # shows registration page
    erb(:"users/new")
  end

  post '/users/new' do
    if User.where('lower(username) = ?', params[:username].downcase).any?
      flash[:registration_notice] = "An account with that Username already exists."
      redirect('/users/new')
    end
    if  User.where('lower(email_address) = ?', params[:email_address].downcase).any?
      flash[:registration_notice] = "An account with that Email Address already exists."
      redirect('/users/new')
    end
    @user = User.new(username: params[:username], display_name: params[:display_name], email_address: params[:email_address])
    @user.password = params[:password]
    @user.save!
    session[:user_id] = @user.id
    redirect('/chitter')
  end

  # login
  get '/session/new' do
    erb(:"session/new")
  end

  post '/session/new' do
    @user = User.find_by_username(params[:username])
    if @user.nil? || @user.password != params[:password]
      flash[:invalid_username_or_password] == true
      redirect('/session/new')
    end

    session[:user_id] = @user.id
    redirect('/chitter')
  end

  delete '/session' do
    session[:user_id] = nil
    redirect('/chitter')
  end

  get '/users' do
    @users = User.all
    erb(:users)
  end

end
