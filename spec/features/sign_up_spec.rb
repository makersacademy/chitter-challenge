feature 'User sign up' do
  scenario 'I can sign up to chitter as me' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_current_path ('/peeps')
    expect(User.first.email).to eq "pug@gmail.com"
  end
end
