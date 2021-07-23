require 'sinatra/base'
require 'dotenv'
require 'rom'
require './db/db'
require './lib/chitter'
require './db/repos/peep_repo'
require './db/repos/user_repo'

Dotenv.load

class Chitter < Sinatra::Base
  enable :method_override

  # use DB module to pass ROM container to Chitter class instance variable
  configure do
    Chitter.set_rom(DB.container)
  end

  before '/users' do
    rom = Chitter.retrieve_rom
    users = UserRepo.new(rom)
  end

  before '/peeps' do
    rom = Chitter.retrieve_rom
    peeps = PeepRepo.new(rom)
  end

  get '/' do
    erb :sign_up
  end

  get '/home' do
    erb :home
  end

  get '/users' do
    @users = users.to_a
    erb :user_list
  end

  get '/users/:id' do |id|
    @user = users.by_pk(id)
    erb :user_profile
  end

  post '/users' do
    Chitter.set_user = users.create(user_name: params[:un], password: params[:pw], email: params[:email], name: params[:name])
    redirect '/home'
  end

  #unsure if I could make wildcards work here to make it a permissive update?
  patch '/users/:id' do |id|
    users.update(id, user_name: params[:un], password: params[:pw], email: params[:email], name: params[:name])
    redirect '/home'
  end

  delete '/users/:id' do |id|
    users.delete(id)
    redirect '/home'
  end

  get '/peeps' do
    @peeps = peeps.all_reverse_chrono
    erb :home
  end

  get '/peeps/:id' do |id|
    @peep = peeps.by_pk(id)
    erb :home
  end

  post '/peeps' do
    @peep = peeps.create(user_id: params[:uid], content: params[:content], created_at: params[:created_at])
    erb :home
  end

  patch '/peeps/:id' do |id|
    @peep = peeps.update(id, content: params[:content])
    redirect '/home'
  end

  delete '/peeps/:id' do |id|
    peeps.delete(id)
    redirect '/home'
  end

end
