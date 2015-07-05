feature 'Users can reply to peeps' do

  scenario 'logged-in users can reply to other users peeps' do
    another_user_peeps
    sign_in
    visit '/another_name'
    expect(page).to have_selector 'form#reply'
  end

  scenario 'non logged-in users cannot reply to peeps' do
    another_user_peeps
    visit '/another_name'
    expect(page).not_to have_selector 'form#reply'
  end

  scenario 'when a user replies the reply appears on the other users page' do
    another_user_peeps
    sign_in
    visit '/another_name'
    fill_in 'reply', with: 'Hello to you too'
    click_button 'Reply'
    expect(page).to have_content 'Hello to you too'
  end

  scenario 'when a user replies the reply appears on the users page' do
    another_user_peeps
    sign_in
    visit '/another_name'
    fill_in 'reply', with: 'Hello to you too'
    click_button 'Reply'
    click_button 'Home'
    expect(page).to have_content 'Hello to you too'
  end

end
