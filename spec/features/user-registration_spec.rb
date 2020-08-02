feature 'registration' do

  scenario 'user can sign-up' do
    generate_example_peeps
    visit '/'
    fill_in('name', with: 'test')
    fill_in('email_address', with: 'test@test.com')
    fill_in('password', with: 'password123')
    click_button 'Sign-up'
    expect(page).to have_content "Welcome to your dashboard, Test"
  end

end
