feature 'User Management' do
  scenario 'I am showed a welcome message after I sign up' do
    sign_up
    expect(page).to have_content('Welcome, Joe')
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end
end
