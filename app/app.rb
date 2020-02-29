# require 'bcrypt'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'json'
require 'sinatra/flash'
# require_relative '../lib/peep'
require_relative './models/user'
require_relative './models/peep'
# require_relative './database_connection_setup'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'chitter_development')

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  enable :sessions, :method_override

  before do
    @user = (User.find_by id: session[:user_id])
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new' do
    Peep.create(body: params[:body], time_posted: Time.now)
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = (Peep.find_by id: params[:id])
    erb :'peeps/edit'
  end

  patch '/peeps/:id' do
    peep = (Peep.find_by id: params[:id])
    peep.update(body: params[:body])
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    peep = (Peep.find_by id: params[:id])
    peep.destroy
    redirect '/peeps'
  end

end
