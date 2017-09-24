def create_peep
  visit '/peeps/new'
  expect(page.status_code).to eq(200)
  fill_in :title, with: 'title'
  fill_in :text, with: 'text'
  click_button 'submit'
end
