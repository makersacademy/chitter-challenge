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
      erb :'/peeps/new'
    else
      flash[:log_in] = 'log in to peep!'
      redirect '/peeps'
    end
  end

  post '/peeps/new' do
    peep = Peep.create(content: params[:content], time: Time.now)
    peep.user = current_user
    peep.save
    redirect '/peeps'
  end

end
