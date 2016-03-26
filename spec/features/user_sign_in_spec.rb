feature 'User sign in' do

  let(:user) { user = create(:user) }

  scenario 'successful sign in' do
    sign_in(user)
    expect(page).to have_content "Welcome #{user.name}!"
  end

end
