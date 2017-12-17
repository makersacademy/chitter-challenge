feature "signing up as a new user" do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('example@email.com')
  end
  scenario "user name is posted next to the tweet" do
    sign_up
    post_test

    within 'ul#tweets' do
      expect(page).to have_content "Dave"
    end
  end
end
