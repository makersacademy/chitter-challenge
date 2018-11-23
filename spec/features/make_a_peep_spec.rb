feature 'Making a peep' do
  scenario 'sending a peep' do
    visit('/')
    fill_in 'peep_content', with: 'Hi, everybody!'
    click_button 'Make A Peep'
    expect(page).to have_content 'Hi, everybody!'
  end
end
