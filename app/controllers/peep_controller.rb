class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message],
                       username: params[:username],
                       full_name: params[:full_name])
    peep.save
    redirect '/peeps'
  end

  get '/peeps/new' do
    if current_user
      @user = current_user
      erb :'peeps/new'
    else
      redirect '/sessions/none'
  end

end
