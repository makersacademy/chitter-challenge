feature 'users can sign up' do
  scenario 'user enters registration details and recieves confirmation' do
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Hello 123 Test'
    expect(User.first.email_address).to eq('123@test.com')
  end
end
feature 'sign up verifcation process' do
  scenario 'user password verifcation does not match' do
    expect{ sign_up_incorrect_password_verification }.not_to change { User.count }
    expect(page).to have_content "Password does not match the confirmation"
    expect(current_path).to eq '/users/new'
  end
  scenario 'user signs up with a preregistered email address' do
    sign_up
    expect{ sign_up }.not_to change { User.count }
    expect(page).to have_content "Email address is already taken"
    expect(current_path).to eq '/users/new'
  end
  scenario 'user signs up with a preregistered username' do
    sign_up
    expect{ sign_up }.not_to change { User.count }
    expect(page).to have_content "Username is already taken"
    expect(page).to have_content "Email address is already taken"
    expect(current_path).to eq '/users/new'
  end
  scenario 'user entered information persists if fail verification' do
    sign_up_incorrect_password_verification
    expect(page).to have_selector("input[value='234 Test']")
    expect(page).to have_selector("input[value='234@test.com']")
    expect(page).to have_selector("input[value='234test']")

  end
  scenario 'user cannot sign up with blank email address' do
    expect{ sign_up_blank_email }.not_to change { User.count }
    expect(page).to have_content "Email address must not be blank"
    expect(current_path).to eq '/users/new'
  end
  scenario 'user cannot sign up with blank name' do
    expect{ sign_up_blank_name }.not_to change { User.count }
    expect(page).to have_content "Name must not be blank"
    expect(current_path).to eq '/users/new'
  end
end
feature 'User receives a welcome email on sign up' do
  scenario 'user successfully signs up to service' do
    sign_up
    expect(ChitterMailer).to have_received(:call).with(User.first)
  end
end
