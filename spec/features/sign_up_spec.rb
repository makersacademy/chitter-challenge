feature 'sign up experience' do
  scenario 'user enters necessary details' do
    sign_up
    expect(current_path).to eq '/chitter-newsfeed'
    expect(page).to have_content 'Welcome, Alexander Dominic Chalk'
  end

  scenario 'user enters two different passwords' do
    sign_up(:password_failure)
    expect(current_path).to eq '/new-user'
    expect(page).to have_content 'Password and confirmation password do not match'
    expect(find_field('email_address').value).to eq 'test@example.com'
    expect(find_field('user_name').value).to eq 'chocolate_rain'
    expect(find_field('real_name').value).to eq 'Alexander Dominic Chalk'
  end

  scenario 'user leaves email field blank' do
    sign_up(:email_empty)
    expect(current_path).to eq '/new-user'
  end
    
  scenario 'user enters incorrectly formatted email address' do
    sign_up(:email_incorrect)
    expect(current_path).to eq '/new-user'
  end
end
