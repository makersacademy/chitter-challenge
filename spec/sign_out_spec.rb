feature 'User signs out' do

  let(:user) { user = create(:user) }

  scenario 'while being signed in' do
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome example93')
  end

end
