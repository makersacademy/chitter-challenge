require_relative "../app/models/user"

describe User do
  describe "#find_by_user_id" do
    it "select user by id" do
      user_1 = User.create(id: 1, email: "vale@gmail.com", name: "vale", username: "vale")
      user_2 = User.create(id: 2, email: "vale@gmail.com", name: "vale", username: "vale")

      expect(User.find_by_user_id(1)).to eq(user_1)
      expect(User.find_by_user_id(2)).to eq(user_2)
    end
  end
end
