describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(peeper: 'Lupita', username: 'Lupi', email: 'lupitareyes@example.es', password: 'lupitrona')

      expect(user.id).to eq 3
    end

    it 'secures the password with BCrypt' do
      pass = BCrypt::Password.create('lumber')

      u = User.new(peeper: 'Lumberman', username: 'Lumbi', email: 'lumberman@example.es', password: pass)

      expect(u.save).to eq true
      expect(User.get(u.id).password).to eq pass
    end
  end

  describe '.get' do
    it 'gets a specific user' do
      expect(User.get(1).peeper).to eq 'Bonito'
    end
  end
end
