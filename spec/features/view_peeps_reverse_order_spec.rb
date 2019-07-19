# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'See all peeps in reverse chronological order' do
  scenario 'A user can see all peeps in revers chronological order ' do
    visit('/')
    fill_in('message', with: "Feature test peep")
    click_button('Post')
    sleep 1
    fill_in('message', with: "Another feature test peep")
    click_button('Post')
    expect(page.find('li:nth-child(1)')).to have_content 'Another feature test peep'

  end
end
