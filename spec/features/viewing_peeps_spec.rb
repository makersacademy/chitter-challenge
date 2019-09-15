feature 'Viewing peeps' do
  scenario 'user can visit the index page' do
    visit('/')
    expect(page).to have_content 'Chitter!'
  end
end

feature 'Viewing peeps' do
  scenario 'user can view tweets from the index page' do
    visit('/')
    expect(page).to have_content 'Good morning!'
  end
end
