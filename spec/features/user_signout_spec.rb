feature 'User signs out' do

  let(:user) do
    create(:user)
  end

  scenario 'when logged in' do
    log_in(user)
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content("Welcome, #{user.name}")
  end

end
