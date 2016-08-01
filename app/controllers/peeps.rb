class Chitter < Sinatra::Base

  before do
    @peeps = Peep.all
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  post '/peeps' do
    if current_user
      peep = Peep.create(body: params[:peep], time: Time.now)
      peep.user = current_user
      peep.peep = Peep.get(params[:in_reply_to])
      peep.save
      redirect '/peeps'
    else
      flash.keep[:notifications] = ['You need to log in to peep']
      redirect '/peeps'
    end
  end

    post '/peeps/reply' do
      @replying_to = Peep.get(params[:replying_to])
      erb :'peeps/index'
    end
end
