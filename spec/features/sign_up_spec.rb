feature 'Sign up' do
  scenario 'A user can sign up to Chitter' do
    visit '/users/new'
    fill_in('email',with: 'example@example.com')
    fill_in('password',with: 'example123')
    fill_in('name',with: 'Example Surname')
    fill_in('username',with: 'exampleusername')
    click_button('Sign Up')

    expect(page).to have_content "Welcome, Example Surname"
  end
end
