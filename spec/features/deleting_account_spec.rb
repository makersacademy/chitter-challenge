feature 'deleting account' do
  scenario 'user is deleted after clicking through warning' do
    sign_up_and_get_peeping

    click_button 'My Account'
    click_button 'Delete'

    expect(page).to have_content 'Are you sure you want to delete your account?'

    click_button 'Delete'

    expect(page).to have_content 'Your account has been deleted'
    expect(current_path).to eq '/peeps'
    expect(page).to have_button 'Sign In'
  end
end
