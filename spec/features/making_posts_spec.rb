feature 'Sharing new tips' do
  before do
    sign_up
  end
  scenario 'On the new post page I can share a tip' do
    click_button 'Add New Tip'
    fill_in :tip, with: 'Remember to eat your greens!'
    click_button 'Submit'

    within 'div#posts'
    expect(page).to have_content 'Remember to eat your greens!'
  end

  scenario 'I can add a new post if logged in' do
    click_button 'Add New Tip'
    expect(current_path).to eq '/posts/new'
  end

  scenario 'I can see at what time and day a post was made' do
    time = DateTime.now
    click_button 'Add New Tip'
    fill_in :tip, with: 'Remember to eat your greens!'
    click_button 'Submit'

    within 'div#posts'
    expect(page).to have_content "Created at #{time.strftime("%R")} on #{time.strftime("%d/%-m/%-y")}"
  end

  scenario 'I can see that I posted as my name is attributed to the post' do
    click_button 'Add New Tip'
    fill_in :tip, with: 'Remember to eat your greens!'
    click_button 'Submit'
    within 'div#posts'
    expect(page).to have_content "haletothewood"
  end
end
