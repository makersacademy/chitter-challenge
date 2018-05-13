feature 'sign out' do
  scenario 'Can no longer tweet when signed out' do
    create_user
    visit '/chitter'
    click_on 'Sign in'
    fill_in 'username', with: 'Yoncé'
    fill_in 'password', with: 'lemonade'
    click_button 'Sign in'
    click_on 'Sign out'
    expect(page).not_to have_content('Yoncé')
  end
end
