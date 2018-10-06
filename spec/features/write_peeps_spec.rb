feature 'Features - Write peeps' do
  scenario 'user sends a peep to chitter' do
    visit('/all_peeps')
    fill_in :peep, with: 'my first peep, hurray!'
    click_button 'Submit'
  end
end
