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

end
