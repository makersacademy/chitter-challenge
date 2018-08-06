require 'pg'

feature 'submit a peep' do
  scenario 'peep shows on feed page' do
    visit ('/login')
    fill_in('username', with: 'eddyt993')
    click_button 'Submit'
    fill_in('peep', with: 'Where we dropping boys?')
    click_button 'Submit'

    expect(page).to have_content "Where we dropping boys? by @eddyt993 at"
  end
end
