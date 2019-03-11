RSpec.feature 'Logout' do

  let!(:user) { User.create(
               :name => "Beatrice",
               :username => "beacourage",
               :email => "bea@bea.com",
               :password => "hello12345"
                )}

  let(:email) {'bea@bea.com'}
  let(:password){'hello12345'}

  context 'logout' do
    scenario 'A user can logout' do
    sign_in(email, password)
    expect(page.current_path).to eq '/profile'
    logout_user
    expect(page.current_path).to eq '/'
    end
  end

end
