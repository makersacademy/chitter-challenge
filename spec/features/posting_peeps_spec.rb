feature 'Posting Peeps' do
  scenario 'I can upload new peeps to be shown on the Peep page' do
    visit '/peeps'

    click_button 'Add a new Peep'
    fill_in :message, with: 'Hi guys!'
    click_button 'submit'

    expect(page).to have_content('Hi guys')
  end
end
