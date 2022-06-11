feature 'homepage' do
  scenario 'shows the title Chitter' do
    visit '/chitter'
    expect(page).to have_content 'Chitter'
  end

  scenario 'shows multiple peeps not in an array' do
    add_two_peeps
    expect(page).to have_content "What's peeping with YOU!?"
    expect(page).to have_content "I'm loving to peep"
    expect(page).not_to have_content ["What's peeping with YOU!?", "I'm loving to peep"]
  end
end
