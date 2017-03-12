class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    @peeps =@peeps.reverse
    erb :peeps
  end

  get '/peeps/add' do
    if current_user
      erb :add
    else
      flash.next[:notice] = 'Cannot peep - please sign in or create an account first'
      redirect '/'
    end
  end

  post '/peeps' do
      peep = Peep.create(content: params[:peep_content], created_at: DateTime.now, user_id: current_user.id)
      # params[:hashtags].split.each do |h|
      #   peep.hashtags << Hashtag.first_or_create(name: h)
      # end
      # peep.save
      redirect '/peeps'
  end

end
