class Chitter < Sinatra::Base

  get '/makers/sign_up' do
    erb :'makers/sign_up'
  end

  post '/makers/new_maker' do
    if params[:password] != params[:confirm_password] || params[:password] == ''
      flash.next[:error] = 'oops.  make sure you entered a valid password and matching confirmation.'
      redirect '/makers/sign_up'
    end
    maker = Maker.create(username: params[:username], email: params[:email], password: params[:password])
    if maker.save
      session[:maker_id] = maker.id
      redirect '/peeps'
    else
      flash.next[:error] = maker.errors.full_messages[-1]
      redirect '/makers/sign_up'
    end
  end

  get '/makers/profile/:name' do
    @maker = Maker.first(username: params[:name])
    @peeps = @maker.peeps
    erb :'makers/profile'
  end

end
