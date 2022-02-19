# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Viewing peeps in reverse order' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "Hello"
    expect(page).to have_content "Ciao ragazzi"
    expect(page).to have_content "I love coding weekends"
  end
end
