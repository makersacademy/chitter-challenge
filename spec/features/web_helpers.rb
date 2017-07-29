def create_peep(content:)
  visit '/peeps/new'
  fill_in :content, with: content
  click_button 'Submit'
end
