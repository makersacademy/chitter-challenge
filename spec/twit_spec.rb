describe Twit do
  let!(:user) do
    User.create(email:'scumlord@potus.com',
    password: '1234',
    password_confirmation: '1234',
    full_name: "Donald J. Trump",
    user_name: "@realDonaldTrump")
  end

  let!(:twit) do
    Twit.create(user: user,
    content: 'gonna build a wall...',
    date: '30/1/1984')
  end

  describe "#creation" do
    it "is a valid datamapper model" do
      expect(twit).to be_valid
    end
  end
end
