feature 'testing infrastructure' do 
  scenario 'displays Hello, world!' do 
    visit('/')
    expect(page).to have_content('Hello, world!')
  end 
end 