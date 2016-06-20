class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :'peeps/index'
  end

  post '/peep' do
    if @current_user
      peep = Peep.create(message: params[:message], user_id: @current_user.id)

      flash.next[:errors] = peep.errors.full_messages
      redirect to '/'
    else
      flash.next[:errors] = ["You must be logged in to peep."]
      redirect to '/'
    end
  end
end
