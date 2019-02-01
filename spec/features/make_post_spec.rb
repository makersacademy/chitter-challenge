# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'posting message' do
  scenario 'user can post a message' do
    visit('/peeps')
    fill_in('peep', with:'My first Peep!')
    click_on 'Submit'
    expect(page).not_to have_content("Tom")
  end
end
