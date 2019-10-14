feature 'registration' do
  scenario 'a user can sign up' do
    visit '/new_user'
    fill_in('User Name', with: 'Danielle')
    fill_in('Password', with: 'password123')
    fill_in('Email', with: 'dani@peep.com')
    click_button('Submit')

    expect(page).to have_content "Welcome, Danielle"
  end
end
