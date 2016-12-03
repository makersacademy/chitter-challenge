require './app/app.rb'
require_relative 'web_helper.rb'


feature 'The user views a list of peeps' do

  scenario 'The user adds a peep and then can see it in the list' do

    visit '/new_peep'
    fill_in 'peep', with: 'This is my message'
    click_button('Peep')
    within 'ul#peeps' do
      expect(page).to have_content("This is my message")
    end
  end
end
