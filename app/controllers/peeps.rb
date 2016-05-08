class Chitter < Sinatra::Base

  get '/peep' do
    @peep = Peep.new
    erb :'peep/new'
  end

  post '/peep' do
    @peep = Peep.create(content: params[:content],
                        in_response_to: params[:in_response_to])
    @peep.user = current_user
    if @peep.save
      redirect '/'
    else
      flash.now[:errors] = @peep.errors.full_messages
      erb :'peep/new'
    end
  end

end
