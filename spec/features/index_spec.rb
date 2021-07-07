feature '/' do 

  scenario 'has homepage' do 
    visit "/"
    expect(page).to have_content 'Welcome to Chitter!'
    expect(page).to have_link "Create New Peep", href: "/peeps/create"
  end
  
end
