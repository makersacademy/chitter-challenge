feature 'homepage' do
  scenario 'homepage' do 
    visit '/'
    expect(page).to have_content 'Hello World'
  end
end 
