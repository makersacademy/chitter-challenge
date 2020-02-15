# require 'pg'

# feature 'Viewing peeps' do
#   scenario 'A user can see bookmarks' do
#     connection = PG.connect(dbname: 'bookmark_manager_test')

#     Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
#     Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
#     Bookmark.create(url: 'http://www.google.com', title: 'Google')

#     visit '/bookmarks'

#     expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
#     expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
#     expect(page).to have_link('Google', href: 'http://www.google.com')
#   end
# end