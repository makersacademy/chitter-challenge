# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'View Posts' do
  scenario 'Posts are displayed in reverse chronological order' do
    visit('/')

    click_link(text: 'New Peep', href: '/new_peep')
    fill_in(name: 'peep_text', with: 'This is a test peep.')
    click_button(id: 'submit', value: 'Add Peep')

    click_link(text: 'New Peep', href: '/new_peep')
    fill_in(name: 'peep_text', with: 'This is another test peep.')
    click_button(id: 'submit', value: 'Add Peep')

    expect(page.find('li:nth-child(1)')).to have_content 'This is another test peep.'
    expect(page.find('li:nth-child(2)')).to have_content 'This is a test peep.'
  end
end