# feature  'Filtering links' do
#
# 	before(:each) do
# 		Link.create(url: 'http://www.makersacademy.com', message: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
# 		Link.create(url: 'http://www.google.com', message: 'Google', tags: [Tag.first_or_create(name: 'search')])
# 		Link.create(url: 'http://www.zombo.com', message: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
# 		Link.create(url: 'http://www.bubble-bobble.com', message: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
# 	end
#
# 	scenario 'I can filter links by tag' do
# 	  visit '/tags/bubbles'
#
# 	  expect(page.status_code).to eq(200)
# 		within 'ul#links' do
# 		  expect(page).not_to have_content('Makers Academy')
# 		  expect(page).not_to have_content('Code.org')
# 		  expect(page).to have_content('This is Zombocom')
# 		  expect(page).to have_content('Bubble Bobble')
# 		end
# 	end
# end
