feature 'Viewing Chitter feed' do
  scenario 'visitng the homepage' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end
