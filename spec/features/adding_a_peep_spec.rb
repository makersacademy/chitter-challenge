require './app/app.rb'
require_relative 'web_helper.rb'


feature 'Adding a peep' do
  scenario 'The user goes to the peep page and adds a peep' do

    visit '/new_peep'
    fill_in 'peep', with: 'This is my message'
    click_button('Peep')
    within 'ul#peeps' do
      expect(page).to have_content("This is my message")
    end
  end
end
