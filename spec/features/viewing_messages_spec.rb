feature 'viewing messages' do 
  scenario 'visiting the index page' do 
    visit ('/')
    expect(page).to have_content "Chitter"
  end 
  scenario 'seeing a list of messages' do
    visit ('/')
    expect(page).to have_content "hi"
    expect(page).to have_content "databases are fun"
  end 
end 