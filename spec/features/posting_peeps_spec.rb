feature 'posting peeps' do 
  scenario 'user visits the chitter feed' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end
