feature 'signing up' do
  scenario 'click sign up' do
    visit "/"
    click_button "Sign Up"
    expect(current_path).to eq "/users/new"
  end

  scenario 'sign up' do
    visit "/users/new"
    fill_in 'email', with: "bernard@fake.com"
    fill_in 'username', with: "bernardleanse"
    click_button "Submit"
    expect(page).to have_content "bernardleanse"
  end
end
