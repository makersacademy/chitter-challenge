feature 'post message' do
  scenario 'Peep box exists' do
    visit('/')
    expect(page).to have_button("Post Peep!")
  end

  scenario 'peep is posted and shown' do
    visit('/')
    fill_in('peep', :with => 'Hello!!This is my first peep!')
    click_button('Post Peep!')
    expect(page).to have_content('Hello!!This is my first peep!')
  end
end
