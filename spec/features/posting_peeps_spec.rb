require 'pg'

feature 'Add a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/posting_peeps')
    fill_in('peeps', with: 'Boris could be fined yet again, none of which is fine for a PM!')
    click_button('Submit')

    expect(page).to have_content('Boris could be fined yet again, none of which is fine for a PM!')
  end
end
