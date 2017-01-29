feature '#Post Peep' do
  scenario 'User can post a peep to Chitter' do

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

click_button 'Post Peep'

expect(current_path).to eq '/timeline/new'
expect(page.status_code).to eq 200
fill_in 'peep', with: "Byron Rocks!"
time = Time.now
click_button 'Submit'
expect(current_path).to eq '/timeline'
expect(page).to have_content 'Byron Rocks!'
expect(page).to have_content time
end

end
