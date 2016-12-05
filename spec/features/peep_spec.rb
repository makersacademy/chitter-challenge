

RSpec.feature 'Create Peeps' do

  scenario 'User can create a new peep' do
    visit '/peep/new'
    fill_in 'peep', with: 'This is my first peep!'
    click_button 'Submit'
    expect(page).to have_content 'This is my first peep!'

  end

end
