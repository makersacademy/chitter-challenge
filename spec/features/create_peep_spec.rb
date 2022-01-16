feature 'Create a new peep' do
  scenario 'Adding a peep' do 
    visit '/peeps/new'

    fill_in('message', with: 'Test peep')
    click_button 'submit'

    expect(page).to have_content 'Test peep'
  end 
end
