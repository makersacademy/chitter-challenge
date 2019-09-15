feature 'Viewing chitter page' do
  scenario 'Visting main page' do
    visit('/')
    expect(page).to have_content "Its a fake twitter bitch"
  end
end

feature 'viewing all peeps' do
  scenario ' see all peeps in reverse chornological order' do
    visit('/')
    expect(page).to have_content "its not the best"
  end
end
