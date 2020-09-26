feature 'testing infrastructure' do 
  scenario 'displays Peeps' do 
    visit('/')
    expect(page).to have_content('Peeps')
  end 
end 