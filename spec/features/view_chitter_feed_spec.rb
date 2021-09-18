feature 'Viewing feed' do 
  scenario 'A user can see all previous posts' do 
    visit('/feed')
    expect(page).to have_content("Hello World")
    expect(page).to have_content("Hello Chitter")
  end
end
