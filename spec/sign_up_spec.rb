feature 'Users' do

  scenario 'sign up and are redirected' do
    email = 'user@example.com'
    expect { sign_up }.to change { User.count }.by(+1)
    expect(page).to have_content "Hi #{email}"
  end

  scenario 'cannot sign up with an invalid email address' do
    email = 'email.com-@'
    expect { sign_up(email) }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'cannot sign up with passwords that do not match' do
    expect {
      sign_up(email = 'user@example.com', password = 'secret*123', confirm_password = 'secret*124')
    }.not_to change { User.count }
    expect(page).to have_content 'Password does not match the confirmation'
  end

end
