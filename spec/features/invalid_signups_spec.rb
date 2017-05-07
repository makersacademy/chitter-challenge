feature 'User cannot sign up with invalid information' do
  scenario 'User cannot sign in without email address' do
    expect { signs_in_without_email }.not_to change { User.count }
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'User cannot sign in with invalid email address' do
    expect { signs_in_with_bad_email }.not_to change { User.count }
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'User cannot sign up with existing information' do
    signs_in_successfully
    expect { signs_in_successfully }.not_to change { User.count }
    expect(page).to have_content 'Email is already taken'
    expect(page).to have_content 'Username is already taken'
  end
end
