class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :'/peeps/latest'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do #Add error message when user not logged in and somwhow goes here
    peep = Peep.create(maker: current_user.name,
    user_handle: current_user.username,
    body: params[:body])
    current_user.peeps << peep
    current_user.save
    redirect '/'
  end


end
