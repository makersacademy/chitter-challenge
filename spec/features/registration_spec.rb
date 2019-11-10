feature 'registration' do
  scenario 'signing up' do
    visit('/users')
    fill_in('bitter_handle', with: 'mr_tester')
    fill_in('first_name', with: 'Tester')
    fill_in('last_name', with: 'Lester')
    fill_in('email', with: 'test_mail@gmail.com')
    fill_in('password', with: 'superStrongPassword')
    click_button("submit")
    expect(page).to have_content("Welcome, Tester")
  end
end