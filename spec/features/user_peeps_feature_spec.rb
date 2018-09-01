require './app'

feature 'users can peep' do
  scenario 'displayed on main page' do
    visit '/'
    click_button 'Make a Peep'
    fill_in('peep', with: 'test peep')
    click_button 'Submit'
    expect(page).to have_content 'test peep'
  end
end
