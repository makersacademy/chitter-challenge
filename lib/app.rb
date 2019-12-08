require 'sinatra/base'

require_relative 'models/peep.rb'
require_relative 'models/user.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find_by(id: session[:id])
    @peeps = Peep.all.order created_at: :desc
    @message = session.delete(:message)
    erb :index
  end

  post '/peeps/new' do
    Peep.create(user_id: 1, content: params[:peep_text])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.create(name: params[:user_name], email: params[:user_email])
    if user.id.nil?
      session[:message] = "This email is already registered, sorry."
    else
      session[:id] = user.id
    end
    redirect '/peeps' 
  end

  get '/logout' do
    session.delete(:id)
    redirect '/peeps'
  end
end 
