class Chitter < Sinatra::Base

  get '/peeps' do
    session[:peep_order] == 1 ? @peeps = Peep.all : @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  get '/peeps/new' do
    redirect 'sessions/new' if !current_user
    @peep = Peep.new
    erb :'peeps/new'
  end

  post '/peeps' do
    @peep = Peep.create(message: params[:message], user: current_user, media: params[:media], date: Time.now)
    params[:tags].split(',').map!(&:strip).each do |tag|
      @peep.tags << Tag.first_or_create(tag: tag.downcase)
    end
    if @peep.save
      session[:draft_message] = @peep.message
      redirect to('/peeps')
    else
      flash.now[:errors] = @peep.errors.full_messages
      erb :'peeps/new'
    end
  end

  post '/peeps/ascending' do
    session[:peep_order] = 1
    redirect to('/peeps')
  end

  post '/peeps/descending' do
    session[:peep_order] = 0
    redirect to('/peeps')
  end

  delete '/peeps/destroy' do
    peep = Peep.first(id: params[:id])
    peep.destroy
    redirect '/peeps'
  end

  get '/peeps/peep/:id' do
    redirect 'sessions/new' if !current_user
    @peep = Peep.first(id: params[:id])
    @replies = Reply.all(peep_id: @peep.id)
    # puts "Replies is:"
    # p @replies
    erb :'peeps/peep'
  end

  post '/peeps/peep/reply/:id' do
    @peep = Peep.first(id: params[:id])
    @reply = Reply.create(message: params[:message], peep: @peep, user: current_user,  date: Time.now)
    if @reply.save
      redirect to("/peeps/peep/#{@peep.id}")
    else
      flash.next[:errors] = @reply.errors.full_messages
      redirect to("/peeps/peep/#{@peep.id}")
    end
  end

end
