feature 'Inital test' do
  scenario 'hello world' do
    visit '/chitter'
    expect(page.status_code).to eq 200    
    expect(page).to have_content 'Hello world'
  end
end
