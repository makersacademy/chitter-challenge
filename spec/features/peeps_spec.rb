feature 'View Peeps' do
  scenario 'user can see existing Peeps in their feed' do
  Peep.create(text: 'Give me that milk', created_at: '00:03:56')
    visit('/peeps')
    within('ul#peeps') do
      expect(page).to have_content('Give me that milk')
    end
  end
end
