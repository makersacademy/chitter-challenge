feature 'So that I can appreciate the context of a peep' do
  scenario 'I want to see the time at which it was made' do
    visit('/peeps/new')
    fill_in('peep', with: 'My first peep')
    click_button 'Submit'
    expect(page).to have_content (Time.now).strftime("%H:%M:%S")
  end
end
