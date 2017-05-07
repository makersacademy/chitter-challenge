feature 'Errors when signing up to Chitter' do
  scenario 'Wrong password confirmation will not create user.' do
    expect { sign_up_wrong }.to change { User.all.count }.by 0
  end
  scenario 'Missmatching passwords will keep you in current page.' do
    sign_up_wrong
    expect(current_path).to eq('/')
  end
  # scenario 'Missmatching passwords prompt error message.' do
  #   sign_up_wrong
  #   expect(page).to have_content 'Password and confirmation password do not match'
  # end
  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    # expect(page).to have_content('Email is already taken')
  end
end
