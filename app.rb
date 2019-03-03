require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/peep'
require 'pg'
require 'data_mapper'
require 'time'

class Chitter < Sinatra::Base

   if ENV["RAILS_ENV"] = 'test'
    DataMapper.setup(:default, 'postgres://postgres@127.0.0.1:5432/chitter_test')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  else
    DataMapper.setup(:default, 'postgres://student@127.0.0.1:5432/chitter_prod')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

  get '/' do
    @user = User.current_user
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    User.create(:name=>params[:user_name],:handle=>params[:handle],:created_at=>Time.now)
    User.create_current_user
    redirect '/'
  end
    
  post '/peep' do
    @user = User.current_user
    @peep = Peep.new(:user_id=>@user.id,:peep_text=>params[:peep_text],:created_at=>Time.now)
    @peep.user = @user
    @peep.save
    redirect '/'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end