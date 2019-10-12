feature 'Add a new peep' do
  # scenario 'user sees the new peep button on the /peeps page' do
  #   visit '/peeps'
  #   expect(page).to have_button 'New peep'
  # end

  scenario 'user can write a peep and add it to list of peeps' do
    visit '/peeps/new'
    fill_in('name', with: 'John Smith')
    fill_in('handle', with: 'js2019')
    fill_in('message', with: 'This is a test peep')
    click_button 'Submit'
    expect(page).to have_content('This is a test peep')
  end 
end
