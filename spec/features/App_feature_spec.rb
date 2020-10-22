require 'pg'

feature 'viewing peeps' do
  scenario 'it displays test text' do
    visit('/peeps')
    expect(page).to have_content("My first peep")
    expect(page).to have_content("My second peep")
  end
end
