
feature 'index page presentation' do
  scenario 'choose to peep a message' do
    visit '/'
    expect(page).to have_content('Post Your Peep!')
  end
end

feature 'creating peeps' do
  scenario 'user can input a peep' do
    visit '/'
    expect(page).to have_field('post')
    expect(page).to have_field('tags')
    expect(page).to have_selector('input', id: 'save')
  end
end
