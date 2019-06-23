require 'sinatra/base'
require 'data_mapper'
require 'pg'
load 'db.rb'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :peeps

end

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :published, Boolean, default: false
  property :created_at, DateTime
  
  belongs_to :user

end

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :welcome
  end

  get '/register' do
    erb :register
  end

  post '/users' do
    @user = User.create(name: params[:username])
    session[:id] = @user.id
    redirect '/user_success'
  end

  get '/user_success' do
    id = session[:id]
    @user = User.get(id)
    erb :user_success
  end

  get '/peep' do
    id = session[:id]
    @user = User.get(id)
    erb :peepery
  end

  post '/newpeep' do
    id = session[:id]
    peep = Peep.create(body: params[:body], published: true, created_at: Time.now, user_id: id)
    result = peep.save
    p "OUTCOME OF SAVE"
    p result 
    p "I AM A PEEP, ROH ROH ROH"
    p peep
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all #:order => :created_at.desc
    @users = User.all
    p "PRINTING ALL THOSE IMVISIBLE PEEPS"
    p @peeps
    p "ALL DA USAHS"
    p @users
    erb :index
  end

  get '/peepery' do
    id = session[:id]
    @user = User.get(id)
    erb :peepery
  end

  run! if app_file == $0
end