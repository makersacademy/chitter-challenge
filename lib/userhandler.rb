require './app/data_mapper_setup.rb'

class UserHandler

  def create_user(params)
    User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                name: params[:name],
                username: params[:username]
               )
  end
end
