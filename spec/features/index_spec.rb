feature '/' do 

  scenario 'has homepage' do 
    visit "/"
    expect(page).to have_content 'Welcome to Chitter!'
  end
  
end
