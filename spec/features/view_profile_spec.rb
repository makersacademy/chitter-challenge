feature 'view profile' do
  scenario "i can create an account, log in and see my profile information" do
    create_account
    sign_in
    click_button('View Profile')
    expect(page).to have_content ('username')
    expect(page).to have_content ('100')
    expect(page).to have_content ('m')
  end
end
