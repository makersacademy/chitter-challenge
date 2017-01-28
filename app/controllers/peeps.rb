class Chitter < Sinatra::Base
  get '/peeps/new' do
    if session[:user_id]
      erb :'peeps/new'
    else
      redirect '/'
    end
  end

  post '/peeps' do
    peep = Peep.create(body: params[:body], time_stamp: Time.now)
    user = User.get(session[:user_id])
    peep.users << user
    peep.save
    redirect to('/')
  end
end
