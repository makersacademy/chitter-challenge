feature "Welcome" do
  scenario "Welcomes a visitor to Chitter" do
    visit '/'
    
    expect(page).to have_content "WELCOME TO CHITTER"
  end
end