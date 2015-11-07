feature "signing up without an email" do
  scenario "maker cannot sign up without an email" do
    expect{ sign_up_without_email }.to_not change(Maker, :count)
    expect(page).to have_content 'Email address required.'
  end
end
