feature 'User signs out' do
  before(:each) do
    sign_up
  end

  scenario 'while being signed in' do
    click_button "Sign Out"
    expect(page).to have content "Goodbye!"
  end
end
