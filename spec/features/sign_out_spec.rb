feature 'FEATURE: sign out' do

  let(:name) { 'J T Kirk' }
  let(:email) { 'JTK@test.com' }
  let(:user_name) { 'TheShat' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }

  before do
    User.create(name: name, email: email, user_name: user_name, password: password, password_confirmation: password_confirmation)
  end

  scenario 'can click to sign out' do
    sign_in(email, password)
    click_button('sign_out')
    expect(page).to have_content("Successfully logged out")
  end

end
