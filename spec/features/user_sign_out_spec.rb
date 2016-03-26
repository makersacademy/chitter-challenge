feature 'User sign out' do

  let(:user) { user = create(:user) }

  scenario 'successful sign out' do
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
  end
end
