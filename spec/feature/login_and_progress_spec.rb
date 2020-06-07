require 'sinatra'
require 'pg'

feature 'Homepage' do
  scenario 'We should be able to log in with credentials' do
    visit '/'
    fill_in 'uname', with: 'nwmbutler'
    fill_in 'psw', with: '1234'
    click_button 'Login'
    expect(page).to have_content("The Peeps!\ndo you wanna PEEP!\nPEEP\nor go to the PEEPS!\nVIEW")
  end
end

# feature 'Bookmark Manager' do
#   scenario "it should produce bookmarks" do
#     connection = PG.connect(dbname: 'bookmark_manager_test')
#     connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com','Makers');")
#     connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com','Destroy All');")
#     connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com','Google');")
#
#     visit '/bookmarks'
#
#     expect(page).to have_content "Makers"
#     expect(page).to have_content "Destroy All"
#     expect(page).to have_content "Google"
#   end
# end
