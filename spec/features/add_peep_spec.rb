require 'pg'

feature 'Post a peep' do
  scenario 'can post a peep on chitter feed' do
    visit('/peeps/add')
    fill_in('username', with: "ruby123")      
    fill_in('message', with: "This is my first peep!")
    click_button('Post')
    expect(page).to have_content "This is my first peep!"
  end
end