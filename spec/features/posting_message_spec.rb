feature 'posting to chitter' do
  scenario 'can see form to post chitter' do
    visit '/chitters/new'
    expect(page.status_code).to eq 200
    expect(page).to have_content "What's on your mind?"
    expect(page).to have_button 'Submit'
  end

  scenario 'have button new chitter' do
    visit '/chitters'
    expect(page).to have_button 'New Chitter'
  end

  scenario 'can see posted chitters' do
    visit '/chitters/new'
    fill_in 'chit', with: 'Hello'
    click_button 'Submit'
    expect(page).to have_content 'Hello'
    expect(current_path).to eq '/chitters'
  end

  scenario 'there are no links in the database at the start of the test' do
    expect(Chitter.count).to eq 0
  end
end
