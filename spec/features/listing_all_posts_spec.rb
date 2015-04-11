feature 'User browses the list of posts' do

  before(:each) do
    Post.create(peep: 'blah blah blah',
                user: 'paulwallis42',
                tags: [Tag.first_or_create(text: 'life')])
    Post.create(peep: 'smile smile smile',
                user: 'stephkovach18',
                tags: [Tag.first_or_create(text: 'happy')])
    Post.create(peep: 'grin grin grin',
                user: 'rogerwallis10',
                tags: [Tag.first_or_create(text: 'happy')])
    Post.create(peep: 'live long and prosper',
                user: 'gillianwallis10',
                tags: [Tag.first_or_create(text: 'life')])
  end

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('blah blah blah')
  end

  scenario 'filtered by a tag' do
    visit '/tags/search'
    expect(page).not_to have_content('blah blah blah')
    expect(page).not_to have_content('live long and prosper')
    expect(page).to have_content('smile smile smile')
    expect(page).to have_content('grin grin grin')
  end

end
