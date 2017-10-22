feature 'View Peeps' do
  scenario 'user can see existing Peeps in their feed' do
  Peep.create(username: 'maggie69', name: 'Margaret Thatcher', message: 'Give me that milk', created_at: '00:03:56')
    visit('/feed')
    within('ul#peeps') do
      expect(page).to have_content('maggie69')
      expect(page).to have_content('Margaret Thatcher')
      expect(page).to have_content('Give me that milk')
      expect(page).to have_content('00:03:56')
    end
  end
end
