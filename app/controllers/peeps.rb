class Chitter < Sinatra::Base

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    if current_user
      erb(:'peeps/new')
    else
      redirect('/')
    end
  end

  post '/peeps' do
    peep = Peep.new(message: params[:message], time: Time.now.strftime(TIME_FORMAT))
    current_user.peeps << peep
    current_user.save
    redirect('/peeps')
  end
end
