feature 'Post a peep to chitter' do

  scenario 'I can write a peep in a text field' do
    visit('/')
    visit('/post_peep')
    expect(page).to have_field("New Peep")
  end

  scenario 'I post a peep to chitter by clicking a button' do
    visit('/')
    visit('/post_peep')
    expect(page).to have_link(href: '/post_peep')
  end

end
