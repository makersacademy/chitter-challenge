# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Viewing peeps' do
  scenario 'Able to view peeps in chronological order' do
    visit('/add_peep')
    fill_in 'peep', with: 'Peepy peep'
    click_button 'Submit'
    visit('/view_peeps')
    expect(page).to have_content 'Peepy peep'
  end
end
