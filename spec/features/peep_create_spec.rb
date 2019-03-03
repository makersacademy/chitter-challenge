feature 'add new' do
  scenario 'submit a peep via a form' do
    visit '/chitter'
    click_button 'New peep'
    fill_in(:peep, with: 'My bf is gr8')
    click_button 'Go!'
    expect(page).to have_content 'My bf is gr8'
  end
end
