feature 'feature.Homepage' do
  scenario 'Header' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'Sign up button' do
    visit('/')
    click_button "Sign up"
    expect(page).to have_content "Fill in details below"
  end
end
