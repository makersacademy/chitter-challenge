class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/peeps' do
    @user = current_user
    Peep.create(message: params[:peep], user_id: @user.id)
    redirect '/'
  end
end
