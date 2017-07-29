
feature 'peeps' do
  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'message', with: "Hey! I'm leaving a peep!"
    click_button 'send'
    expect(page).to have_content "Hey! I'm leaving a peep!"
  end
end
