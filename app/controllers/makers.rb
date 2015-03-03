get '/makers/new' do
  @maker = Maker.new
  erb :"makers/new"
end

post '/makers' do
  @maker = Maker.create(:name => params[:name],
                       :username => params[:username],
                       :email => params[:email],
                       :password => params[:password],
                       :password_confirmation => params[:password_confirmation])
  if @maker.save
    session[:maker_id] = @maker.id
    redirect to ('/')
  else
    flash.now[:errors] = @maker.errors.full_messages
    erb :"makers/new"
  end
end