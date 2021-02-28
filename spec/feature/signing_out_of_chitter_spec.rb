feature 'user can sign out of chitter' do
  scenario 'users logs out from homepage' do
    sign_in_to_chitter
    click_button('Log out')
    expect(page).to have_content('You have successfully signed out of Chitter')
    expect(page).not_to have_link('New Peep', href: '/peeps/new')
  end
end
