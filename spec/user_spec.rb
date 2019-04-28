require './models/user'

describe User do
  describe '#all' do
      it "contains more than 1 user" do
        user_1 = User.create(email: 'heurich.gui@nomail.com', password: 'pass12345', name: 'Gui Heurich', username: 'guiheurich')
        user_2 = User.create(email: 'heurich.gui@nomail.com2', password: 'pass123452', name: 'Gui Heurich2', username: 'guiheurich2')
        users = User.all
        expect(users.length).to eq 2
        expect(users.first).to be_a User
        expect(users.first.email).to eq('heurich.gui@nomail.com')
      end
    end

  describe '#create' do
      it "creates a new user" do
        user = User.create(email: 'heurich.gui@nomail.com', password: 'pass12345', name: 'Gui Heurich', username: 'guiheurich')
        users = User.all
        expect(users.first).to be_a User
        expect(users.first.password).to eq('pass12345')
        expect(users.first.name).to eq('Gui Heurich')
        expect(users.first.username).to eq('guiheurich')
      end
    end
end
