describe User do
  describe '.create' do
    it 'creates a new user' do
      # user = User.create(peeper: 'Lupita', username: 'Lupi', email: 'lupitareyes@example.es', password: 'lupitrona')

      # expect(user.id).to eq 3

      expect{ User.create(
        peeper: 'Lupita',
        username: 'Lupi',
        email: 'lupitareyes@example.es',
        password: 'lupitrona')}
      .to change { User.all.count }.by 1
    end

    ### EDDIE:
    # Given that you're passing an encrypted password to User#new in the controller,
    # this is more of an integration test, than part of the user_spec.
    # If, however, you were to move encryption into the User class this test would stay here (implemented slightly differently).
    it 'secures the password with BCrypt' do
      # pass = BCrypt::Password.create('lumber')

      u = User.new(peeper: 'Lumberman', username: 'Lumbi', email: 'lumberman@example.es', password: 'lumber')

      expect(u.save).to eq true
      expect(User.get(u.id).password).to eq 'lumber'
    end
  end

  describe '.get' do
    it 'gets a specific user' do
      expect(User.get(1).peeper).to eq 'Bonito'
    end
  end
end
