class Chitter < Sinatra::Base

  get '/' do
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    if current_user
      time = Time.new.strftime("%d/%m/%Y %R")
      peep = Peep.create(message: params[:message], time: time)
      current_user.peeps << peep
      current_user.save
      redirect to '/peeps'
    else
      flash.keep[:notice] = 'You need to log in to send a peep'
      redirect to '/peeps'
    end
  end

end
