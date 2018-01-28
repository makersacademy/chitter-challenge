feature 'sign up functionality' do
  scenario 'new users can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, satoshi")
  end
end
