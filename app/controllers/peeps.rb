class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'messages/peeps'
  end

  get '/peeps/new' do
    erb :'messages/new'
  end

  post '/peeps' do
    if current_user
      peep = Peep.create(message: params[:message], email: current_user.email)
      redirect '/peeps'
    else
      flash.keep[:peeps] = ['Must sign in to post new peeps']
      redirect '/'
    end
  end
end
