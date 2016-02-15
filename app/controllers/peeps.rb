class Chitter < Sinatra::Base

  get '/' do
    if session[:user_id]
      redirect to '/peeps'
    else
      redirect '/users/new'
    end
  end

  get '/peeps' do
    @peep = Peep.all(order: [ :time.desc ])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    if session[:user_id]
      erb :'peeps/new'
    else
      redirect '/users/new'
    end
  end

  post '/peeps' do
    Peep.create(user: current_user,
                content: params[:content],
                time: Time.now)
    redirect to '/peeps'
  end

  post '/response' do
    peep = Peep.get(params[:current_peep])
    reply = Response.create(user: current_user,
                            content: params[:content],
                            peep: peep, time: Time.now)
    peep.responses << reply
    peep.save
    redirect to '/'
  end

end
