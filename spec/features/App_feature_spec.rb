require 'pg'

feature 'viewing peeps' do
  scenario 'it displays peeps' do
    visit('/peeps')
    expect(page).to have_content('test text')
  end
end
