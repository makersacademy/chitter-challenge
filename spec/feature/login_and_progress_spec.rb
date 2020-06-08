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

# feature 'displays PEEPS' do
#   scenario "it should display PEEPS" do
#     connection = PG.connect(dbname: 'chitterdatabase_test')
#     connection.exec("INSERT INTO chits (chit, username) VALUES ('test','nwmbutler');")
#     connection.exec("INSERT INTO chits (chit, username) VALUES ('test2','steve001');")
#
#     visit '/all_peeps'
#
#     expect(page).to have_content("test", "nwmbutler")
#     expect(page).to have_content("test2", "steve001")
#   end
# end
