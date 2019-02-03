require 'sinatra'
require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/peep'
require './app/models/user'

class Shitter < Sinatra::Base

  enable :sessions

  configure :development do
    DataMapper.setup :default, "postgres://localhost/shitter"
    DataMapper.finalize
    DataMapper.auto_migrate!
    set :views, "app/views"
    set :public_dir, "public"
  end

  get '/' do
    erb :welcome
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    if session[:user_id] != nil
      @current_username =  User[(session[:user_id]-1)].username
    end
    erb :index
  end

  post '/user' do
    @user = User.create(email: params[:email], username: params[:username], first_name: params[:first_name], last_name: params[:last_name], password: params[:password])
    session[:user_id] = @user.id
    redirect '/peeps'
  end

  post '/peeps' do
    Peep.create(body: "#{params[:peep_entry]}", user_id: session[:user_id])
    redirect '/peeps'
  end

end


# require 'sinatra'
# require 'data_mapper'
# require 'dm-postgres-adapter'
# require './lib/peep'
# require './lib/printer'
#
# class Chitter < Sinatra::Base
#
#   configure :development do
#     DataMapper.setup(:default, 'postgres://localhost/chitter')
#     DataMapper.finalize
#     DataMapper.auto_upgrade!
#   end
#
#   get '/peeps' do
#     @peeps = Peep.print_peeps
#     erb :peeps
#   end
#
#   post '/peeps' do
#     Peep.create(content: params[:peep])
#     redirect '/peeps'
#   end
# end
