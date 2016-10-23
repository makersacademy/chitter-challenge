class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                    name: params[:name],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get "/users/profile/:username" do
   user = User.first(username: params[:username].downcase)
   peeps = user ? user.peeps(order: [:timestamp.desc]) : []
   peep_list = partial(:"peep/peep", locals: { peeps: peeps })
   erb(:"user/index", locals: { peep_formatted_list: peep_list, user: user })
 end

end
