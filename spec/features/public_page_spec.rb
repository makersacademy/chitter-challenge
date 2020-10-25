feature 'Public Page' do 
  scenario 'title is shown' do 
    visit '/'
    expect(page).to have_content 'CHITTER'
  end
end
