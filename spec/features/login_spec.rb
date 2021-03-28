feature 'logins to SHOUTER and allows you to post as the logged in person' do
  scenario '' do
    visit '/'
    click_button 'SIGN UP'
    fill_in 'name', with: 'Chewbacca'
    fill_in 'username', with: 'Chewie9999'
    fill_in 'email', with: 'chewie@mfalcon.com'
    fill_in 'password', with: 'Gra44rgh'
    click_button 'SIGN UP'
    click_button 'SIGN OUT'
    click_button 'LOG IN'
    fill_in 'username', with: 'Chewie9999'
    fill_in 'password', with: 'Gra44rgh'
    click_button 'LOG IN'
    expect(page).to have_content('Welcome Chewie9999')
    fill_in 'shout_box', with: 'RARRRGHHHH'
    click_button 'SHOUT'
    expect(page).to have_content('@Chewie9999')
  end
end
