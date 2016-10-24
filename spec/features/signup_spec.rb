feature 'Signup' do
  scenario 'A logged out user can create a new user account' do
    create_account
    expect(User.count).to eq 1
  end

  scenario "A user cannot sign up without an email address" do
   expect { create_account_nil_email }.not_to change(User, :count)
 end

  scenario 'I cannot sign up with an existing email' do
    create_account
    expect { create_account }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
