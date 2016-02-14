class Chitter < Sinatra::Base

helpers do

  def sign_up_errors?
    @new_user.errors.full_messages.size > 0
  end

  def sign_up_errors
    @new_user.errors.full_messages
  end

end

  post '/sign_up' do
    @new_user = User.new(user_name: params[:user_name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])

    if @new_user.save
      session[:user_id] = @new_user.id
      redirect '/welcome'
    else
      flash.now[:error_password] =
      sign_up_errors.select {|err| err.include? 'Dur-brain'}.join("/n")
      flash.now[:error_user_name] =
      sign_up_errors.select {|err| err.include? 'Brother'}.join("/n")
      flash.now[:error_email] =
      sign_up_errors.select {|err| err.include? 'Friend'}.join("/n")
      flash.now[:new_user_email_memo] = @new_user.email
      flash.now[:new_user_user_name_memo] = @new_user.user_name
    end
    erb :'user/index'
  end
end
