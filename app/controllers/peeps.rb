class Chitter < Sinatra::Base

  get '/peeps' do
    erb :'peeps/index'
  end

  post '/peeps' do
    if current_user
      peep = Peep.create(body: params[:peep], time: Time.now)
      peep.user = current_user
      peep.peep = Peep.get(params[:in_reply_to])
      p peep
      p Peep.get(params[:in_reply_to])
      p params[:in_reply_to]
      peep.save
      redirect '/peeps'
    else
      flash.keep[:notifications] = ['You need to log in to peep']
      redirect '/peeps'
    end
  end

    post '/peeps/reply' do
      p params[:replying_to]
      @replying_to = Peep.get(params[:replying_to])
      p @replying_to
      erb :'peeps/index'
    end
end
