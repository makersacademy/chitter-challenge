feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'elonmusk@space.com')
    fill_in('password', with: 'tesla123')
    click_button('Submit')

    expect(page).to have_content "Welcome, elonmusk@space.com"
  end
end
