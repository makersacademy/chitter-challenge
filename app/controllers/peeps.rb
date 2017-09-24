class Chitter < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    @peep = current_user.peeps.new(peep_text: params[:peep_text])
    if @peep.save
      current_user.save
      redirect '/peeps'
    else
      flash.now[:errors] = @peep.errors.full_messages
      erb :'peeps/new'
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

end
