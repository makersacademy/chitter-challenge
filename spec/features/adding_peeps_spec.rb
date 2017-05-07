feature 'Adding peeps to the main page' do
  scenario 'Users can type and create peeps' do
    signs_in_successfully
    fill_in :peep, with: 'Hello world!'
    click_button 'Peep!'
    expect(page).to have_content 'Hello world!'
  end
end
