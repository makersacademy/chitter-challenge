feature 'First message on Chitter' do
  scenario 'See message on homepage' do 
    
    visit '/'
    expect(page).to have_content "Welcome to Chitter"
  end
end 

