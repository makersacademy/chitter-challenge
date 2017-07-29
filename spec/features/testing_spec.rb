feature 'tests working' do

  scenario 'is working' do
    visit '/peeps'
    expect(page).to have_content 'test working'
  end
  
end
