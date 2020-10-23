require 'pg'

feature 'creating peeps' do
  scenario 'User can create peeps' do
    visit('/peeps/new')
    fill_in('Peep', with: 'Congratulations to the Astronauts that left Earth today. Good choice')
    click_button('Submit')

    expect(page).to have_content 'Congratulations to the Astronauts that left Earth today. Good choice'
  end
end
