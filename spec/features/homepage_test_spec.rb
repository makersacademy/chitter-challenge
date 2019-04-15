feature 'Views homepage' do
  scenario 'Can run app and visit homepage' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
  end
end 
