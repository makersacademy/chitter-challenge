feature 'registration' do
  scenario 'a maker can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with:'password123')
    fill_in('username', with:'rubberduck')
    click_button('Submit')

    expect(page).to have_content "Welcome, rubberduck"
  end
end
