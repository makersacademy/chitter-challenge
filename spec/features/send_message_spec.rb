feature 'sending a message' do
  scenario 'user can send a message' do
    visit('/feed')
    fill_in "peep", with: "Good Morning!"
    click_button('Post Peep')
    expect(page).to have_content('Good Morning!')
  end
end