feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'

    fill_in('name', with: 'Ania')
    fill_in('username', with: 'an')
    fill_in('email', with: 'an@email.com')
    fill_in('password', with: 'a1')
    click_button('Submit')

    expect(page).to have_content "Welcome, Ania"
  end
end
