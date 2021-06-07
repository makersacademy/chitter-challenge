feature 'Feature: Sign up to Shouter and see for yourself' do
  scenario 'User can sign up' do
    visit '/'
    click_button 'SIGN UP'
    fill_in 'name', with: 'Chewbacca'
    fill_in 'username', with: 'Chewie9999'
    fill_in 'email', with: 'chewie@mfalcon.com'
    fill_in 'password', with: 'Gra44rgh'
    click_button 'SIGN UP'
    expect(page).to have_content("Welcome Chewie9999")
  end
end
