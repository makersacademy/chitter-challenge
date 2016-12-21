class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/peeps'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    if current_user
      peep = Peep.create(message: params[:message], username: current_user.username, name: current_user.name)
      redirect '/peeps'
    else
      flash.keep[:errors] = ["Must sign in or sign up before posting a peep"]
      redirect '/'
    end
  end

end
