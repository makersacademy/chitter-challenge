require './app/models/user'

describe User do
  let! (:user) {User.create(first_name: "Darth",
                           last_name: "Vader",
                           email: 'darth_vader@gmail.com',
                           username: "Darth_Vader",
                           password: "notanakin",
                           password_confirmation: "notanakin")}

  describe '.authenticate' do
    it 'returns the user if credentials match a record' do
      expect(User.authenticate(user.username, user.password)).to eq user
    end

    it 'returns nil if credentials do not match a record' do
      expect(User.authenticate("Darth", user.password)).to be_nil
      expect(User.authenticate(user.username, 'hateyoda')).to be_nil
    end
  end
end
