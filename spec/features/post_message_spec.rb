require 'pg'

feature 'post peeps' do
  scenario 'user is able to post peep' do
    visit ('/timeline')
    fill_in('peep', with: 'a working peep')
    click_button('Post Peep')

    expect(page).to have_content 'a working peep'
   end
end
