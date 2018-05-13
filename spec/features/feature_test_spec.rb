require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/')
    expect(page).to have_content "The night I lost CTRL"
    expect(page).to have_content "More code, more cache"
    expect(page).to have_content "Everyday, tryna get beta"
  end
end
