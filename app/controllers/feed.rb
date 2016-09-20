class Chitter < Sinatra::Base

  get '/feed' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    erb :'feed/index'
  end

  post '/feed' do
    peep = Peep.new(message: params[:message])
    peep.user_id = current_user.id
    if peep.save
      flash[:notice] = "Peep peep!"
    else
      flash[:error] = peep.errors.full_messages
    end
    redirect '/feed'
  end

end
