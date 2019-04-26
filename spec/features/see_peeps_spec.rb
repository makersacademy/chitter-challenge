feature 'So that I can see what others are saying' do
  scenario 'I want to see all peeps in reverse chronological order' do
    visit('/all_peeps')
    expect(page).to have_content 'My second peep'
    expect(page).to have_content 'My first peep'
  end
end
