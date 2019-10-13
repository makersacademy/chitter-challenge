feature 'adding peeps' do
  scenario 'I can add peeps to chitter' do
    visit '/'
    fill_in :text, with: 'This is my First peep'
    click_button 'Add peep'
    expect(page).to have_content 'Peep added to Chitter'
  end
end
