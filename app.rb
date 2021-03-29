require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'
require './lib/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @user = session[:user_name]
    @peeps = Peep.all
    erb :index
  end

  post '/new_peep' do
    if session[:user_name] == nil
      @account = "Anon Peeper"
    else
      @account = session[:user_name]
    end
    Peep.add(peep: params[:peep], account: @account)
    redirect '/'
  end

  delete '/:id' do
    Peep.delete(id: params[:id])
    redirect '/'
  end

  get '/:id/edit' do
    @peep = Peep.find(id: params[:id])
    erb :'peeps/edit'
  end

  patch '/:id' do
    Peep.update(id: params[:id], peep: params[:peep])
    redirect('/')
  end

  get '/:id/replies/new_reply' do
    @peep_id = params[:id]
    erb :'replies/new_reply'
  end

  post '/:id/replies' do
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    if session[:user_name] == nil
      @reply_account = "Anon Peeper"
    else
      @reply_account = session[:user_name]
    end
    con.exec("INSERT INTO replies (reply, peep_id, account) VALUES ('#{params[:reply]}', '#{params[:id]}', '#{@reply_account}');")
    redirect '/'
  end

  #Users
  get '/users/new_user' do
    erb :"users/new_user"
  end

  post '/new_user' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    session[:user_name] = user.name
    redirect '/'
  end

  #User sign in

  get '/sessions/new_session' do
    erb :"sessions/new_session"
  end

  post '/sessions' do
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{params[:email]}'")
    return nil unless BCrypt::Password.new(result[0]['password']) == params[:password]
    user = User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
    session[:user_id] = user.id
    session[:user_name] = user.name
    redirect('/')
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out'
    redirect('/')
end

  run! if app_file == $0
end
