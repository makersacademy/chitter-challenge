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

 #  get '/makers/recover' do
 #    erb :'makers/recover'
 #  end
 #
 #  post '/makers/recover' do
 #    maker = Maker.first(email: params[:email])
 #    if maker
 #      maker.generate_token
 #      SendRecoverLink.call(maker)
 #    end
 #    erb :'makers/acknowledgment'
 #  end
 #
 #  get '/makers/reset_password' do
 #   @maker = Maker.find_by_valid_token(params[:token])
 #   if(@maker)
 #     session[:token] = params[:token]
 #     erb :'makers/reset_password'
 #   else
 #     "Your token is invalid"
 #   end
 # end
 #
 # patch '/makers' do
 #   maker = Maker.find_by_valid_token(session[:token])
 #   if user.update(password: params[:password], password_confirmation: params[:password_confirmation])
 #     session[:token] = nil
 #     maker.update(password_token: nil)
 #     redirect "/sessions/new"
 #   else
 #     flash.now[:errors] = maker.errors.full_messages
 #     erb :'makers/reset_password'
 #   end
 # end

end
