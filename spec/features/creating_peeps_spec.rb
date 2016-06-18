feature 'Creating peeps' do
  scenario "I can create a new link" do
  	visit '/peeps/new'
  	fill_in 'peep', with: 'This is a test peep'
  	click_button 'Post peep'
  	expect(current_path).to eq '/peeps'
  	within 'ul#peeps' do
  	  expect(page).to have_content('This is a test peep')
  	end
  end
end