feature 'Posting peeps' do
  scenario 'I can post a peep' do
    sign_up
    log_in
    visit '/peeps/new'
    fill_in('peep_text', with: 'Woke up, ate some breakfast, purred at the cat.')
    click_button('Post')
    expect(current_path).to eq '/'
    expect(page).to have_content('Woke up, ate some breakfast, purred at the cat.')
  end
  scenario 'I can see the time a peep was posted' do
    sign_up
    log_in
    visit '/peeps/new'
    fill_in('peep_text', with: 'Posting this message at a timely moment.')
    click_button('Post')
    expect(current_path).to eq '/'
    expect(page).to have_content('Posting this message at a timely moment.')
    expect(page).to have_content(Time.now.strftime("%A %d %B %Y, %H:%M"))
  end
end
