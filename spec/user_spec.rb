describe User do
  describe ".create" do
    it 'creates a new user' do
      user = User.create(:peeper => 'Lupita', :username => 'Lupi', :email => 'lupitareyes@example.es', :password => 'lupitrona')

      expect(user.id).to eq 3
    end

    xit 'secures the password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('lupitrona')

      User.create(:peeper => 'Lupita', :username => 'Lupi', :email => 'lupitareyes@example.es', :password => 'lupitrona')
    end
  end

  describe ".get" do
    it 'gets a specific user' do
      expect(User.get(1).peeper).to eq 'Bonito'
    end
  end
end
