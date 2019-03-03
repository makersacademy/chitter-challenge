feature 'Post a message to chitter' do
  scenario "The message 'I am building a web app' is posted to my chiter feed" do
    visit('/feed')
    click_button('New Peep')
    fill_in('peep', with: 'I am building a web app')
    click_button('Peep!')
    expect(page).to have_content 'I am building a web app'
  end
  scenario "The message 'I am hungry om nom nom' is posted to my chiter feed" do
    visit('/feed')
    click_button('New Peep')
    fill_in('peep', with: 'I am hungry om nom nom')
    click_button('Peep!')
    expect(page).to have_content('I am hungry om nom nom')
  end
end
