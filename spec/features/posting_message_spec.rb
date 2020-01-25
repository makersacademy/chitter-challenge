feature 'creating and viewing a peep' do
  scenario 'user is able to create a peep and see it on the page' do
    visit '/peeps/new'
    fill_in :peep, with: 'This is a test peep'
    click_button 'Submit'
    expect(page).to have_content 'This is a test peep'
  end
end
