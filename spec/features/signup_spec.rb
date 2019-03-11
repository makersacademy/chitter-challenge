RSpec.feature 'User Authentication' do

    let(:name){'Eloise'}
    let(:username){'eloiseks'}
    let(:email){'elo@elo.com'}
    let(:password) { 'london123' }


  context 'Sign Up' do
    scenario 'A user can signup' do
      sign_up(name, username, email, password)
      expect(page.current_path).to eql '/profile'
    end
  end


end
