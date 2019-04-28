feature 'Navigates to homepage' do
  scenario 'user goes to stream' do
    visit "/stream"
    expect(page).to have_content "Welcome to Chitter!"
  end
end
