feature 'adding peep' do
  scenario 'to homepage' do
    sign_up
    log_in
    fill_in :experience, with: "Life is good"
    click_button 'Share'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Life is good"
    within('.peep') { expect(page).to have_content 'Darth_Vader'}
  end

  scenario 'is not possible prior to signing in' do
    visit('/peeps')
    expect(page).not_to have_css "input#experience"
  end
end
