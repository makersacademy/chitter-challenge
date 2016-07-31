feature "User sign up" do

  scenario "I can sign up as a new user" do
    expect{ sign_up }.to change{ User.count }.by(1)
    expect(current_path).to eq '/'
  end

  scenario "I cannot sign up with mismatching password and confirmation" do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change{ User.count }
    expect(current_path).to eq '/user/new'
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario "I cannot sign up without email" do
    expect{ sign_up(email: nil) }.not_to change{ User.count }
    expect(current_path).to eq '/user/new'
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I cannot sign up with an invalid email address" do
    expect{ sign_up(email: 'invalid') }.not_to change{ User.count }
    expect(current_path).to eq '/user/new'
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "I can only sign up with a unique email address" do
    create_user(email: 'duplicated@mail.com')
    expect{ sign_up(email: 'duplicated@mail.com', user_name: 'unique') }.not_to change{ User.count }
    expect(current_path).to eq '/user/new'
    expect(page).to have_content('Email is already taken')
  end

  scenario "I cannot sign up without user name" do
    expect{ sign_up(user_name: nil) }.not_to change{ User.count }
    expect(current_path).to eq '/user/new'
    expect(page).to have_content('User name must not be blank')
  end

  scenario "I can only sign up with a unique user name" do
    create_user(user_name: 'duplicated')
    expect{ sign_up(user_name: 'duplicated', email: 'unique') }.not_to change{ User.count }
    expect(current_path).to eq '/user/new'
    expect(page).to have_content('User name is already taken')
  end

  scenario "I cannot sign up without name" do
    expect{ sign_up(name: nil) }.not_to change{ User.count }
    expect(current_path).to eq '/user/new'
    expect(page).to have_content('Name must not be blank')
  end
end
