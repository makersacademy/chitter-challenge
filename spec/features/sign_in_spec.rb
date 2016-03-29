feature 'Sign in' do
  scenario 'user can sign in' do

    sign_up
    visit '/sessions/new'
    fill_in('email', with: SessionHelpers::EMAIL)
    fill_in('password', with: SessionHelpers::PASSWORD)
    click_button('Sign In')

    expect(page).to have_content("Welcome, #{SessionHelpers::NAME}")
  end
end
