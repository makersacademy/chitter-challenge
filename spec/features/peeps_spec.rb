feature "posting a new peep" do

  scenario "a user can post a peep to database" do
    visit ('/post-peep')
    fill_in('peep', with: 'Hello, Sunny Donny!')
    click_button('Submit')

    expect(page).to have_content 'Hello, Sunny Donny!'
  end

end

feature "user tests" do

  scenario "submit user data to database through sign-up page" do
    visit '/register'
    fill_in('name', with: 'bob dylan')
    fill_in('email', with: 'bob@dylan.com')
    fill_in('username', with: 'bobby-d')
    fill_in('password', with: 'imaBelieber')
    click_button('Submit')

    expect(page).to have_content 'bob@dylan.com'
  end

  scenario "show list of users" do
    visit '/show-users'
    expect(page).to have_content 'persiancookbook@gmail.com'
    expect(page).to have_content 'idontsmoke@gmail.com'
  end

end

feature "basic database testing" do

  scenario "display contents of peeps table" do
    visit ('/')
    expect(page).to have_content 'Hello, world!'
  end

  scenario "check that peeps appear in reverse chronological order" do
    visit ('/')
    this = "Hello, world!"
    that = "Hello, Pyong Yang!"

    expect(this).to appear_before(that)
  end

  scenario "display timestamp for peep" do
    visit '/'

    expect(page).to have_content '2018-03-18 21:46'
  end

end




#this is the same test as the one above
# it enters data through method calls rather than
#   rendering a webpage and entering data, then loading
#   another webpage

# describe '.create' do
#
#   it 'creates a new link' do
#     Link.create(url: 'http://www.testlink.com')
#
#     links = Link.all
#     urls = links.map(&:url)
#     expect(urls).to include ("http://www.testlink.com")
#   end
#
#
#   it 'rejects URL if incorrect syntax' do
#     Link.create(url: 'httttp://www.foo.bar')
#
#     links = Link.all
#     urls = links.map(&:url)
#
#     expect(urls).not_to include 'httttp://www.foo.bar'
#   end
#
# end
#
# describe '.all' do
#   it 'returns all links, wrapped in link instances' do
#     links = Link.all
#     urls = links.map(&:url)
#
#     expect(urls).to include("http://www.google.com")
#   end
# end
