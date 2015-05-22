describe User do

  context 'Checking DataMapper can create and delete entries' do

    it 'should be created and retrieved from the db' do
      expect(User.count).to eq(0)
      User.create(username: 'Big G',
                  name: 'Andy Gout',
                  email: ENV['AG_EMAIL_ADDRESS'],
                  password: 'P0tat0M0nkey123')
      expect(User.count).to eq(1)
      user = User.first
      expect(user.username).to eq('Big G')
      expect(user.name).to eq('Andy Gout')
      expect(user.email).to eq(ENV['AG_EMAIL_ADDRESS'])
      user.destroy
      expect(User.count).to eq(0)
    end

  end

end