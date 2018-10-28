feature "Positng a peep" do
  scenario "by clicking 'Post a Peep'" do
    visit '/'
    click_button 'Post a Peep'
    fill_in :peep, with: 'This is a test peep'
    click_button "Peep!"
    expect(page).to have_content "anonymous\nThis is a test peep"
  end

  scenario "while logged in" do
    register_a_user
    login_user

    click_button 'Post a Peep'
    fill_in :peep, with: "Go Pikachu!"
    click_button 'Peep!'

    expect(page).to have_content "Ash Ketchum @red\nGo Pikachu!"

  end
end
