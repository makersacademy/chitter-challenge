Capybara.app = ChitterChallenge

feature 'Viewing peeps' do
  scenario 'user can see pre-added peeps' do
    visit('/peeps')
    expect(page).to have_content "hello world!"
  end
end

feature 'Adding peeps' do
  scenario 'user can create a peep' do
    visit('peeps/new')
    fill_in :peep, with: 'I do hope this works'
    click_button 'Submit'
    expect(page).to have_content 'I do hope this works'
  end
end