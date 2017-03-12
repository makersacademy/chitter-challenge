class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    redirect 'sessions/new' if !current_user
    @peep = Peep.new
    erb :'peeps/new'
  end

  post '/peeps' do
    @peep = Peep.create(message: params[:message], media: params[:media], user: current_user, date: Time.now)
    params[:tags].split(',').map!(&:strip).each do |tag|
      @peep.tags << Tag.first_or_create(tag: tag)
    end
    if @peep.save
      session[:draft_message] = @peep.message
      redirect to('/peeps')
    else
      flash.now[:errors] = @peep.errors.full_messages
      erb :'peeps/new'
    end
  end

  delete '/peeps' do
    peep = Peep.first(id: params[:id])
    peep.destroy
    redirect '/peeps'
  end

end
