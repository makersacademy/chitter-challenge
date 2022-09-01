require 'pg'

feature 'post message' do
  scenario 'user can post message to Chitter' do
    visit '/'
    click_on 'New Peep'
    fill_in 'new_peep' , with: 'This is my first peep!'
    click_on 'Post'
    expect(page).to have_content 'This is my first peep!'
  end
end