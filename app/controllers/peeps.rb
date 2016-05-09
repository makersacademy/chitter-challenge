class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    if session[:user_id]
      Peep.create(peep: params[:peep],
                         time: Time.now.strftime("%m/%d/%Y at %I:%M%p"),
                         author: current_user.name,
                         handle: current_user.username)
      redirect '/peeps'
    else
      flash.keep[:notice] = 'You have to be logged in to peep'
      redirect to '/sessions/new'
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end
end
