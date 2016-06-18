feature "login" do
  scenario "user can sign up" do
    sign_up
    expect(page).to have_content 'kennbarr'
  end
end
