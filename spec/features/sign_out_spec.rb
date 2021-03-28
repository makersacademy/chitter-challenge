feature 'signs out of SHOUTER and revert back to main page as anonymous shouter' do
  scenario '' do
    visit '/'
    click_button 'SIGN UP'
    fill_in 'name', with: 'Chewbacca'
    fill_in 'username', with: 'Chewie9999'
    fill_in 'email', with: 'chewie@mfalcon.com'
    fill_in 'password', with: 'Gra44rgh'
    click_button 'SIGN UP'
    click_button 'SIGN OUT'
    expect(page).to have_content('Bored of being an anonymous shouter?')
  end
end
