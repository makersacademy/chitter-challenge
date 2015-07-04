feature 'User signs out' do

  let(:user) do
    create(:user)
  end

  scenario 'while being signed in' do
    sign_in(user)
    click_button 'Sign Out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome')
  end

end
