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
end
