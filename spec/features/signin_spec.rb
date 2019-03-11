RSpec.feature 'Signin' do


  let!(:user) { User.create(
               :name => "Beatrice",
               :username => "beacourage",
               :email => "bea@bea.com",
               :password => "hello12345"
                )}

  let(:email) {'bea@bea.com'}
  let(:password){'hello12345'}

  context 'Sign in' do
    scenario 'A user can signin' do
      sign_in(email, password)
      expect(page.current_path).to eql '/profile'
    end

  end
end
