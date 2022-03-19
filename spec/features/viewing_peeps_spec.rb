require 'pg'

feature 'viewing peeps' do
  scenario 'a user can see peeps' do
    visit '/peeps'

    expect(page).to have_content 'What a beautil day!'
    expect(page).to have_content 'Going for a run now'
  end
end