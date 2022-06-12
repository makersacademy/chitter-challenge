feature 'homepage' do
  scenario 'shows the title Chitter' do
    visit '/chitter'
    expect(page).to have_content 'Chitter'
  end

  scenario 'contains a button to sign up' do
    visit '/chitter'
    expect(page).to have_link 'Join Chitter'
  end

  scenario 'shows multiple peeps not in an array' do
    add_two_peeps
    expect(page).to have_content "What's peeping with YOU!?"
    expect(page).to have_content "I'm loving to peep"
    expect(page).not_to have_content ["What's peeping with YOU!?", "I'm loving to peep"]
  end

  scenario 'peeps shows a time stamp' do
    time = double :time, new: Time.new(2022, 06, 12, 15, 49, 02)
    visit '/chitter'
    click_on 'Compose a peep'
    fill_in 'peep', with: "What's peeping with YOU!?"
    click_on 'Share'
    expect(page).to have_content '15:49'
  end
end
