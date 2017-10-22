class Chitter < Sinatra::Base
  get '/makers/new' do
    erb :'makers/new'
  end

  post '/makers' do
    @maker = Maker.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @maker.save
      session[:maker_id] = @maker.id
      redirect '/makers'
    else
      flash.now[:errors] = @maker.errors.full_messages
      erb :'makers/new'
    end
  end

  get '/makers' do
    @maker_email = current_maker.email
    erb :'makers/index'
  end
end
