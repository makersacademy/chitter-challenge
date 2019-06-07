feature Chitter do 
  scenario 'it displays the peeps' do 
    visit '/peeps'
    expect(page).to have_content('Today is a great day! Ask me why...')
  end 

  scenario 'it displays the name' do 
    visit '/peeps'
    expect(page).to have_content('Lauren')
  end 

  scenario 'displays option to add a new peep' do 
    visit '/peeps'
    expect(page).to have_field('text')
  end 

  scenario 'it displays new peep back as the first peep' do
    visit '/peeps'
    fill_in 'text', with: "cant wait to watch love island tonight"
    click_button 'Post Peep'
    expect(page).to have_content("cant wait to watch love island tonight")
  end

  scenario 'it displays buttons to login or sign up' do 
    visit '/peeps' 
    expect(page).to have_button('Login')
    expect(page).to have_button('Sign up')
  end 
end
