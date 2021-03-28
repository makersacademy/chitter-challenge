feature 'Feature: Sign up to Shouter and see for yourself' do
  scenario 'User can sign up' do
    visit '/'
    click_button 'SIGN UP'
    fill_in 'name', with: 'Chewbacca'
    fill_in 'email', with: 'chewie@falcon.com'
    fill_in 'password', with: 'Gra44rgh'
    click_button 'SUBMIT'
    expect(page).to have_content("Logged in: Chewbacca")
  end
end
