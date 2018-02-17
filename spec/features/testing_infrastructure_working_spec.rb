feature 'testing infrastructure' do 
  scenario 'can run app and get home path content' do 
    visit '/'
    expect(page).to have_content "Testing first route"
  end
end