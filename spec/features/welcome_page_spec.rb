feature 'welcome page' do

  scenario 'welcome message appears' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!!!"
    # expect(page).to have_content "Please submit your first messsage"
  end

end
