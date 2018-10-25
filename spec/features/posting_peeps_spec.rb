feature 'posting peeps' do
  scenario 'the user can post a peep and see it on the screen' do
    visit '/peeps/post'
    fill_in :message, with: 'Hello world'
    click_button 'Post'
    expect(page).to have_content 'Hello world'
  end
end

feature 'listing peeps' do
  scenario 'user can see peeps in reverse chronology' do
    Peep.create(message: 'number 1')
    Peep.create(message: 'number 2')
    visit '/peeps'
    expect(page).to have_content 'number 2 number 1'
  end
end
