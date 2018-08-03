feature 'Testing infrastructure' do
  scenario 'if the homepage is functioning' do
    visit ('/')
    expect(page).to have_content 'Welcome, to Chitter, a place for all!'
  end
end
