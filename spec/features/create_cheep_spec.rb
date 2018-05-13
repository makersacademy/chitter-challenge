require './app.rb'

feature Chitter do
  scenario 'Create Cheep' do
    visit '/'
    click_button('Create Cheep')
    fill_in('name', :with => 'Celine Dione')
    fill_in('handle', :with => '@celinedione')
    fill_in('message', :with => 'My heart will go on')
    click_button('Cheep!')
    expect(page).to have_content('My heart will go on')
  end
end
