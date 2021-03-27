feature 'homepage' do
  scenario 'has a homepage' do 
    visit '/'
    expect(page).to have_content '["my first tweet"]'
  end
end 