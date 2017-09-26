def create_peep
  visit '/peeps/new'
  expect(page.status_code).to eq(200)
  fill_in 'message', with: 'Setting up Chitter. This is my first peep.'
  click_button 'Post'
end
