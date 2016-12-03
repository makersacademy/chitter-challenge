require './app/app.rb'

feature 'messages' do
  scenario 'messages are able to be viewed' do
    visit '/messages'
    within 'ul#peeps' do
      expect(page).to have_content("peep 1")
      expect(page).to have_content("peep 2")
    end
  end

  scenario 'so that only a user can post a message' do

    visit '/peep'
    within('form#peep') do
      find_field('message')
      find_button('Peep').click
    end

  end

end
