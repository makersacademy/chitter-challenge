class User
  def initialize(response_data)
    attr_reader :id, :email, :username, :full_name, :password

    response_data = response_data.first

    @id = response_data["id"]
    @email = response_data["email"]
    @username = response_data["username"]
    @full_name = response_data["full_name"]
    @password = response_data["password"]
  end
end