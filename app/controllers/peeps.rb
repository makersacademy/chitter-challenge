class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peeps.all(:order => [:message_created.desc])
    erb :peeps
  end

  get '/peeps/new' do
    if !session[:user_id]
      redirect 'sessions/new'
    else
      erb :peeps_add
    end
  end

  post '/new_peep' do
    Peeps.create(peep_user: session[:username],
                 message: params[:message],
                 message_created: Time.now.to_s)
    redirect '/'
  end

end
