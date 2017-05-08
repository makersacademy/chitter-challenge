
feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, John")
    expect(User.first.email).to eq("john@example.com")
  end

  def sign_up
     visit '/users/new'
     expect(page.status_code).to eq(200)
     fill_in :name, with: "John Smith"
     fill_in :username, with: "j.smith"
     fill_in :email,    with: "john@example.com"
     fill_in :password, with: "123456"
     click_button 'Sign up'
   end

end
