feature 'User sign up' do
  scenario 'I want to sign up to chitter with a username and an email' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq 'test@mail.com'

    expect(current_path).to eq '/chits'

    expect(page).to have_content 'Signed up as: Tester'
    expect(page).to have_content 'test@mail.com'
  end
end
