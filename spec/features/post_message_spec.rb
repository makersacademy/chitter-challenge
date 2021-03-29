feature 'post message' do
  scenario 'I want to be able to post a message' do
    visit '/postmessage'
    fill_in 'peep', with: 'this is my first peep'
    click_button 'post peep'
    expect(page).to have_content 'this is my first peep'

  end
end
