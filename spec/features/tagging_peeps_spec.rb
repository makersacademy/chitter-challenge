feature 'tagging users in peeps' do

  scenario 'I want to tag other users in peeps' do
    tagged_user = User.create(name: 'Ainsley tag', email: 'tag@email.com', password: 'password', handle: 'test_tag')
    sign_up(handle: 'ainsley')
    visit '/peeps/new'
    fill_in :peep, with: '@test_tag hello world'
    click_button 'Post'
    expect(Peep.first.tags.users).to include tagged_user
  end

  scenario 'invalid tags will not be created' do
    tagged_user = User.create(name: 'Ainsley tag', email: 'tag@email.com', password: 'password', handle: 'test_tag')
    sign_up(handle: 'ainsley')
    visit '/peeps/new'
    fill_in :peep, with: '@fake_tag hello world'
    click_button 'Post'
    expect(Peep.first.tags).to be_empty
  end

end