require 'user'

describe 'User' do
  context '#create' do
    it 'can be created' do
      user = User.create(username: 'Chris', email: 'chris@makers.com', password: 'classicWoW')
    end
  end

  context '#username' do
    it "displays Warbler's username" do
      warbler = User.create(username: 'Chris', email: 'chris@makers.com', password: 'classicWoW')
      expect(warbler.username).to eq('Chris')
    end
  end
end
