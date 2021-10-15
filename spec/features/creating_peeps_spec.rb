feature 'Creating peeps' do
  scenario 'user creates a peep' do
    visit('/')
    fill_in :peep_text, with: 'Hello world'

    click_button 'Create peep'

    expect(page).to have_content('Hello world')
  end
end
