feature 'Viewing peeps' do
  scenario "I can see existing peeps on the peep page" do
  	sign_up
  	visit '/peeps/new'
  	fill_in 'peep', with: 'This is a test peep'
  	click_button 'Post peep'
  	visit '/peeps'
  	expect(page.status_code).to eq 200
  	within 'ul#peeps' do
  	  expect(page).to have_content('This is a test peep')
  	end
  end
end