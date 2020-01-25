feature 'peeps display the author' do
  scenario "author's name appearing next to a peep" do
    visit '/users/new'
    fill_in :username, with: "Test user"
    fill_in :password, with: "password123"
    click_button 'Submit'
    click 'Add a peep'
    fill_in :peep, with: 'This is a test peep'
    click_button 'Submit'
    expect(page).to have_content 'Created by Test user'
  end
end
