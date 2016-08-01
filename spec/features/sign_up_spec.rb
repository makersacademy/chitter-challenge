feature "Sign up" do
  scenario "As a new user I want to sign up" do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Hello ty@appsdj.com"
  end
  scenario 'requires a matching password confirmation' do
    expect { sign_up(password_confirmation: "wrong") }.not_to(change(User, :count))
  end
end
