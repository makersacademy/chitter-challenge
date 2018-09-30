feature 'Homepage' do
  scenario 'User can go to home page and see a welcome message' do
    visit("/")
    expect(page).to have_content("Chitter")
    expect(page).to have_button('Login!')
    expect(page).to have_button('Sign up!')
  end
end
