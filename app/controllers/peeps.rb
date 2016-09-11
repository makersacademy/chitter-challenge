class Chitter < Sinatra::Base
  
  get '/' do
    redirect '/peeps/view'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    if current_user
      Peeps.create(peep: params[:peep], users: current_user)
      redirect '/'
    else
      flash[:error] = 'Please sign in to peep'
      redirect '/users/signin'
    end
  end

  get '/peeps/view' do
    @peeps = Peeps.all(:order => [:created_at.desc])
    erb :'peeps/view'
  end

end
