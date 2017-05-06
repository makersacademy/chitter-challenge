feature 'Homepage loads successfully' do
  scenario 'Infrastructure working correctly' do
    visit '/'
    expect(page.status_code).to eq 200
  end

  scenario 'users can sign up and head to the homepage' do
    signs_in_successfully
    expect(page).to have_current_path('/home')
  end

  scenario 'user is greeted upon signing up' do
    signs_in_successfully
    expect(page).to have_content 'Welcome to Chitter, Jack Dorsey'
  end

  scenario 'User cannot sign in without email address' do
    expect { signs_in_without_email }.not_to change { User.count }
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'User cannot sign in with invalid email address' do
    expect { signs_in_with_bad_email }.not_to change { User.count }
    expect(page).to have_content 'Email has an invalid format'
  end
end
