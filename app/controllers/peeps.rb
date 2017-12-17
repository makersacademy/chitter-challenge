class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    if current_user
      erb :'peeps/new'
    else
      flash.keep[:login] = 'You must be logged in to do this'
      redirect '/sessions/new'
    end
  end

  post '/peeps' do
    current_user
    Peep.create(content: params[:content], time: Time.now, name: @current_user.name, username: @current_user.username
    )
    redirect '/peeps'
  end


end
