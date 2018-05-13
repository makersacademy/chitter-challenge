require 'data_mapper'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './lib/comment'
load './datamapper_setup.rb'


class ChitterApp < Sinatra::Base

  configure do
    use Rack::MethodOverride
    enable :sessions
    register Sinatra::Flash
  end

  helpers do

    def set_current_user(user)
      session[:current_user] = user.id
      session[:user_name] = user.user_name
    end

  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    redirect '/sessions/new' unless session[:current_user]
    @peeps = Peep.all(:order => [:created_at.desc])
      .map { |peep| { peep: peep, user: User.get(peep.user_id) } }
    erb :peeps
  end

  post '/peeps/new' do
    user = User.get(session[:current_user])
    peep = user.peeps.new(text: params[:peep])
    peep.save
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      set_current_user(user)
      redirect '/peeps'
    else
      flash[:notice] = "Failed login"
      redirect '/sessions/new'
    end
  end

  post '/sessions/:id' do
    session.clear
    redirect '/sessions/new'
  end

  get '/users/new' do
    erb :register
  end

  post '/users/new' do
    user = User.create(user_name: params[:username],
                       email: params[:email],
                       password: params[:password]
                      )
    if user.saved?
      set_current_user(user)
      redirect '/peeps'
    else
      flash[:notice] = user.errors.values.first
      redirect '/users/new'
    end
  end

  get '/peeps/:id/comments' do
    @comments = Comment.all(:peep => { id: params[:id] } ,:order => [:created_at.desc])
      .map { |comment| { comment: comment, user: User.get(comment.user_id)} }
    @peep = Peep.get(params[:id])
    erb :comments
  end

  post '/peeps/:id/comments' do
    redirect "/peeps/#{params[:id]}/comments"
  end

  post '/peeps/:id/comments/new' do
    user = User.get(session[:current_user])
    peep = Peep.get(params[:id])
    Comment.create(user: user, peep: peep, text: params[:comment])
    redirect "/peeps/#{peep.id}/comments"
  end

  run! if __FILE__ == $0
end
