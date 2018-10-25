class User

  attr_reader :email, :name, :user, :pass

  def initialize(email, name, user, pass, confirm)
    @email = email
    @name = name
    @user = user
    @pass = pass
    @confirm = confirm
  end
end
