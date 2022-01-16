require 'user'

describe User do
  describe '.signup' do
    it 'returns a chitter user' do
      new_user = User.sign_up(
        name: "Testy Testerson",
        username: "Testy_T", 
        password: "PASSWORD", 
        email: "testy@test.com")

      expect(new_user).to be_a(User)
      expect(new_user.name).to eq("Testy Testerson")
      expect(new_user.username).to eq("Testy_T")
      expect(new_user.password).to eq("PASSWORD")
      expect(new_user.email).to eq("testy@test.com")
    end
  end
end
