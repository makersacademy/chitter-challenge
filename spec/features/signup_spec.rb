feature 'signup' do
  scenario 'user is taken to signup page' do
    visit('/')
    click_button('Sign up!')
    expect(page).to have_field('name')
    expect(page).to have_field('username')
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_button('Sign up!')
  end

  scenario 'user details are shown on page' do
    visit('/')
    click_button('Sign up!')
    fill_in('name', :with => 'Charlie')
    fill_in('username', :with => 'charlie123')
    fill_in('email', :with => 'charlie@emailhost.com')
    fill_in('password', :with => 'password321')
    click_button('Sign up!')
    expect(page).to have_content("Thank you for signing up!")
    expect(page).to have_content("Name: Charlie")
    expect(page).to have_content("Username: charlie123")
    expect(page).to have_content("Email: charlie@emailhost.com")
    expect(page).to have_content("Password: password321")
  end
end
