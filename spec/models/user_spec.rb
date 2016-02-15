describe User do
  subject!(:user) do 
    described_class.create(full_name: 'Wade Wilson',
                           username: 'Deadpool',
                           email: 'chimichongas@gmail.com',
                           password: 'ihatewolverine92',
                           password_confirmation: 'ihatewolverine92') 
  end

  describe '#authnticate' do
    it 'user with correct details' do
      existent_user = User.authenticate('Deadpool', 'ihatewolverine92')
      expect(existent_user).to eq user
    end

    it 'user with incorrect details' do
      non_existent_user = User.authenticate('Deadpool', 'wrongPassword')
      expect(non_existent_user).to be_nil
    end
  end
end