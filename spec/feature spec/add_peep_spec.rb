require 'pg'

feature 'adding peep' do
  scenario 'adding a peep to the timeline' do
    visit('/add_peep')
    fill_in('yourPeep', with: "MyFirstPeep")
    click_button('Submit')

    expect(page).to have_content 'MyFirstPeep'
  end
end
