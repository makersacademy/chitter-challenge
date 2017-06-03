feature 'creating a peep' do

  scenario 'user visits /new and receives a form to create a peep' do
    visit '/new'
    expect(page).to have_content('Write a new peep')
  end

  scenario 'user creates a peep' do
    visit '/new'
    fill_in(:peep_content, with: 'Testing that a peep is created')
    click_button('Submit')
    visit '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('Testing that a peep is created')
    end
  end

end
