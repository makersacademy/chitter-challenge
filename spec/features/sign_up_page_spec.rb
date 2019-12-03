feature 'Visit sign-up page' do
  scenario 'User can view sign-up form' do
    visit('/')
    click_button('Sign up!')
    expect(page).to have_field('author_name')
    expect(page).to have_field('author_handle')
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_selector(:link_or_button, 'Sign up!')
  end
end
