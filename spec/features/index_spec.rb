feature 'homepage' do
  scenario 'homepage' do 
    visit '/'
    expect(page).to have_content 'Hello World'
  end
end 

feature '/home' do 
  scenario 'you get greeted by a list of tweets' do 
    visit '/home' 
    expect(page).to have_content "my first tweet"
  end 
end 