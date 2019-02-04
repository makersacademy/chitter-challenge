require 'pg'

feature 'Doing a peep' do

  scenario 'A user can post a new peep' do
    p "this test is running"
    connection = PG.connect(dbname: 'chitter_test')

    visit('/chitter/new')
    fill_in 'post_peep', with: 'Here is my test peep - peep peep'
    click_button('Submit')

    # expect(page).to have_content('Here is my test peep - peep peep')
  end
end







