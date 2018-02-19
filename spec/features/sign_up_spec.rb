feature 'sign up' do
  scenario 'a user can sign up' do
    visit '/sign_up/new'
    fill_in('email', with: 'ben@ben.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, ben@ben.com"
  end
end
