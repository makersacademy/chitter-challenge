ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class ChitterWebsite < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
    @peeps = Peep.all(:order => [:id.desc])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(
      :message => params[:message],
      :created_at => Time.new,
    )
    params[:tags].split(", ").each do |tag|
      tag_to_add = Tag.first(:tagname => tag)
      tag_to_add = Tag.create(:tagname => tag) if tag_to_add == nil
      peep.tags << tag_to_add
      peep.save
    end

    peep.user = current_user
    peep.save
    redirect '/peeps'
  end

  get '/sign_up' do
    erb :'users/sign_up'
  end

  post '/account_setup' do
    user = User.create(
      :name => params[:name],
      :username => params[:username],
      :email => params[:email],
      :password => params[:password]
    )
    session[:user_id] = user.id
    redirect '/welcome'
  end

  get '/welcome' do
    erb :'users/welcome'
  end

  get '/sessions/new' do
    erb :'users/log_in'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/welcome'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'users/log_in'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to '/goodbye'
  end

  get '/goodbye' do
    erb :'users/goodbye'
  end

  get '/filter_by_tag' do
    erb :'tags/filter'
  end

  post '/filtered' do
    session[:searchtag] = params[:searchtag]
    redirect '/filtered'
  end

  get '/filtered' do
    tag = Tag.first(:tagname => session[:searchtag])
    @searchtag = session[:searchtag]
    @peeps = tag.peeps
    erb :'tags/filtered'
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end
end
