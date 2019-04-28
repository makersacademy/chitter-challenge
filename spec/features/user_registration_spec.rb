feature 'registration' do
  scenario 'a user can sign up for chitter' do
    visit '/registration'
    fill_in('email', with: 'test@example.com')
    fill_in('first_name', with: 'Jane')
    fill_in('last_name', with: 'Doe')
    fill_in('user_name', with: 'Jdoe')
    fill_in('password', with: 'password123')
    click_button('Sign Up')
    expect(page).to have_content "Jdoe"
  end
end
