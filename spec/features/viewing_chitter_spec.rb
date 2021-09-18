feature 'viewing the chitter page' do 
  scenario 'user able to visit the chitter mani page' do
    visit ('/chitter') 
    expect(page).to have_content "Chitter"
  end
end
