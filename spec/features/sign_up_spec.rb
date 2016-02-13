feature 'SIGN UP' do
  scenario '-> lets users sign up for an account' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome marcus')
    expect(User.first.email).to eq('marcus@kebab.com')
  end
end
