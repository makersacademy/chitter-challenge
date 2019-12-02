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
end
