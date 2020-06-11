feature 'registration' do
  scenario 'a user can sign up' do
    visit '/signup'
    fill_in('email', with: 'elonmusk@space.com')
    fill_in('password', with: 'tesla123')
    click_button('Sign Up')

    expect(page).to have_content "Welcome, elonmusk@space.com"
  end
end
