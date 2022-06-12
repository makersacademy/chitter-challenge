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
    visit '/chitter'
    click_on 'Compose a peep'
    fill_in 'peep', with: "What's peeping with YOU!?"
    time = Time.now.strftime("%k:%M")
    click_on 'Share'
    expect(page).to have_content(time)
  end

  scenario 'peeps shows a username and name when they have signed up' do
    sign_up_as_penelope
    click_on 'Compose a peep'
    fill_in 'peep', with: "What's peeping with YOU!?"
    click_on 'Share'
    expect(page).to have_content("Penelope Heart")
    expect(page).to have_content("@penelopeheartsyou")
  end

  scenario 'peeps shows a different username and name when they have signed up' do
    sign_up_as_john
    click_on 'Compose a peep'
    fill_in 'peep', with: "What's peeping with YOU!?"
    click_on 'Share'
    expect(page).to have_content("John Pie")
    expect(page).to have_content("@johnjohn!")
  end

end
