require 'pg'

feature 'submiting new peep' do
  scenario 'user submits a new peep' do
    visit('/new')
    fill_in ('peep'), with: 'Hello World'
    click_button ('Submit')
    expect(page).to have_content 'Hello World'
  end
end
