feature 'sign in' do
  scenario 'register adds user to database' do
    expect{sign_up}.to change(User, :count).by(1)
  end
end
