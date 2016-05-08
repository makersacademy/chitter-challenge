class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    if session[:user_id]
      Peep.create(peep: params[:peep],
                         time: Time.now,
                         author: current_user.name,
                         user_name: current_user.username)
      redirect '/peeps'
    else
      flash.keep[:error] = 'You have to be logged in to peep'
      redirect to '/sessions/new'
    end
  end

  get '/links/new' do
    erb :'links/new'
  end
end
