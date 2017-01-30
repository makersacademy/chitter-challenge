feature '#Sign Out' do
  scenario 'user can sign out' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in 'Name', with: 'Byron'
    fill_in 'Email', with: 'thebest@thebest.com'
    fill_in 'User Name', with: 'ByronBest'
    fill_in 'Password', with: 'worldsbestpassword'
    click_button 'Submit'
    expect(current_path).to eq '/timeline'

    click_button 'Sign In'
    expect(current_path).to eq '/sessions/new'
    expect(page.status_code).to eq 200
    fill_in 'User Name', with: 'ByronBest'
    fill_in 'Password', with: 'worldsbestpassword'
    click_button 'Submit'
    expect(current_path).to eq '/timeline'
    expect(page).to have_content 'Welcome, ByronBest'

    click_button 'Sign Out'
    expect(page).to_not have_content 'Welcome, ByronBest'
  end
end
