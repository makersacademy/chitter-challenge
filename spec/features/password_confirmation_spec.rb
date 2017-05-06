feature 'Passwords are checked thoroughly' do
  scenario 'Incorrect passwords do not produce new accounts' do
    expect { signs_up_with_mismatched_passwords }.to change { User.all.count }.by(0)
  end

  scenario 'Page should display error when passwords do not match' do
    signs_up_with_mismatched_passwords
    expect(page).to have_content 'Passwords do not match'
  end

  scenario 'Error message should not appear after signing up successfully' do
    signs_up_with_mismatched_passwords
    expect(page).to have_content 'Passwords do not match'
    signs_in_successfully
    visit '/signup'
    expect(page).not_to have_content 'Passwords do not match'
  end
end
