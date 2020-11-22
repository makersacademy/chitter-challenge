require 'pg'

feature 'Creating peeps' do
  scenario 'Posting a new peep to Chitter' do
    connection = PG.connect(dbname: 'chitter_test')
    visit ('/')
    fill_in('peep', with: 'I had toast for breakfast')
    click_button('Post')

    expect(page).to have_content('I had toast for breakfast')
  end
end
