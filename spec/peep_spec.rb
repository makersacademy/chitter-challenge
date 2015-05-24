
describe Peep do

  context 'Demonstration of how datamapper works' do

    before(:each) do
    @user = User.create(:name => "Anna Klimas",
              :username => "ania2ab",
              :email => "anna@klimas.com",
              :password => "apple",
              :password_confirmation => 'apple')
  end

    it 'peep should be created and retrieved from database' do
      expect(Peep.count).to eq(0)
      Peep.create(message: 'This is my first peep', user_id: @user.id)
      expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.message).to eq('This is my first peep')
      peep.destroy
      expect(Peep.count).to eq(0)
    end
  end
end