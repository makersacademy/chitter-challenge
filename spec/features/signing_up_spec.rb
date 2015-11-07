feature 'signing up' do
  scenario 'sign up as a new user' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, coco')
    expect(User.first.email).to eq('coco@gmail.com')
  end
end
