
class PeepController < Sinatra::Base

  set :views, Proc.new { File.join(File.dirname(__FILE__), '..', "views") }

  register Sinatra::Flash
  enable :sessions

  get '/peeps' do
    @user = User.find_by_id(id: session[:user_id])
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peep/:id' do
    @peep =  Peep.find_by_id(id: params[:id])
    erb :"peeps/show"
  end

  get '/peeps' do
    @user = User.find_by_id(id: session[:user_id])
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    peep = Peep.create(
      peep: params[:peep], user_id: session[:user_id], 
      parent_peep_id:params[:parent_peep_id] )
    redirect to "/peeps"
  end
end