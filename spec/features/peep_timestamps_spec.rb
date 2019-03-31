require 'date'

feature 'user should see timestamp alongside peep' do

  scenario 'posts a peep and sees timestamp displayed with peep' do
    add_cheep('Test Post')
    expect(page).to have_content /\d{2}\/\d{2}\/\d{4} \d{2}:\d{2}:\d{2}/
  end
end
