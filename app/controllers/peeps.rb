class Chitter < Sinatra::Base

  get '/peeps' do
    erb :'peeps/index'
  end

  post '/peeps' do
    if current_user
      peep = Peep.create(body: params[:peep], time: Time.now)
      peep.user = current_user
      peep.save
      redirect '/peeps'
    else
      flash.keep[:notifications] = ['You need to log in to peep']
      redirect '/peeps'
    end
  end
end
