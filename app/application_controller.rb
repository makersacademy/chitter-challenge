ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './data_mapper_setup'
require 'bcrypt'

class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret phrase'

  get '/' do
    redirect '/peeps' if session[:username]
    redirect '/login'
  end

  get '/peeps' do
    @user = session[:username]
    @peeps = Peep.all.sort
    erb(:'/peeps/index')
  end

  post '/peeps' do
    user = User.first(:username => session[:username]) 
    peep = Peep.create(:peep_text => params[:new_peep], :date_time => Time.now)
    user.peeps << peep
    user.save
    redirect '/peeps', 303
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    if params[:confirmation] == params[:password]
      session[:error_msg] = nil
      user = User.new(:first_name => params[:first_name],
                      :last_name => params[:last_name],
                      :username => params[:username],
                      :email => params[:email], 
                      :password => BCrypt::Password.create(params[:password]))
      if user.save
        session[:error_msg] = 'Please log in :)'
        redirect "/login"
      else
        session[:error_msg] = 'Username or Email already in use'
        redirect '/signup'
      end
    else
      session[:error_msg] = "Not matching passwords! Please try again!"
      redirect '/signup'
    end
    redirect '/login', 303
  end

  get '/login' do
    @err = session[:error_msg]
    erb(:login)
  end

  post '/login' do
    session[:error_msg] = nil
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:username] = user.username
      redirect '/peeps'
    else
      session[:error_msg] = 'The email or password is incorrect'
      redirect '/login', 303
    end
  end

  get '/logoff' do
    session.clear
    redirect '/'
  end

  get '/peeps/reply:name' do
    @user = session[:username]
    session[:peep_id] = params[:name].delete(":").to_i
    p  session[:peep_id]
    @peep = Peep.get(session[:peep_id])
    @replies = @peep.replies
    p "#{@peep.peep_text} #{@replies}"
    erb(:'peeps/reply')
  end

  post '/peeps/reply' do
    "#{params[:new_reply]}"
    user = User.first(:username => session[:username]) 
    peep = Peep.first(:id => session[:peep_id])
    reply = Reply.create(:user_id => user.id, :peep_id =>peep.id, :reply_text => params[:new_reply], :date_time => Time.now)
    redirect "/peeps/reply:#{session[:peep_id]}", 303
  end
 
  run! if app_file == $0
end
