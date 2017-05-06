feature 'allows users to register new accounts' do
  scenario 'user can sign up with e-mail, password, name and username' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Logged in as w_gant'
    expect(User.first.email).to eq 'w_gant@yahoo.co.uk'
  end
end
