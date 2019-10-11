feature 'Add a new peep' do
  scenario 'user can write a peep and add it to list of peeps' do
    visit '/peeps/new'
    fill_in('message', with: 'This is a test peep')
    click_button 'Submit'
    expect(page).to have_content 'This is a test peep'
  end
end
