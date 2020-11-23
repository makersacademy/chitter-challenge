require 'pg'

feature 'Post a Peep' do
  scenario 'A user can post a message to chitter' do
    visit('/post')
    fill_in('message', with: 'weekend challenges are so much fun')
    click_button('Submit')
    expect(page).to have_content 'weekend challenges are so much fun'
  end
end
