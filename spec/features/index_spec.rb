feature 'index' do
  scenario 'prints out the greeting title' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end

feature 'peeps' do
  scenario 'form to enter peeps' do
    visit '/peeps'
    expect(page).to have_content "Peep"
    click_on "Post"
  end
end
