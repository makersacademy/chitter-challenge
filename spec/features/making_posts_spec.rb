feature 'Sharing new tips' do
  scenario 'On the new post page I can share a tip' do
    sign_up
    click_button 'Add New Tip'
    fill_in :tip, with: 'Remember to eat your greens!'
    click_button 'Submit'

    within 'div#posts'
    expect(page).to have_content 'Remember to eat your greens!'
  end

  scenario 'I can add a new post if logged in' do
    sign_up
    click_button 'Add New Tip'
    expect(current_path).to eq '/posts/new'
  end

  scenario 'I can see at what time and day a post was made' do
    sign_up
    Timecop.freeze(time = DateTime.now) do
      click_button 'Add New Tip'
      fill_in :tip, with: 'Remember to eat your greens!'
      click_button 'Submit'
    end
    within 'div#posts'
    expect(page).to have_content "Created at #{time.strftime("%R")} on #{time.strftime("%d/%-m/%-y")}"
  end
end
