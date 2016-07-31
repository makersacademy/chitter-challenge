feature 'Sign in' do

  let(:user) { user = create(:user) }

  scenario 'with correct credentials' do
    sign_in(user)
    expect(page).to have_content "Welcome #{user.username}"
  end
end
