feature 'view timeline' do 

  scenario 'logged in user can see timeline with link to post' do 

    visit('/login')
    fill_in :email_address, with: "j_schmoe@gmail.com"
    fill_in :password, with: "7gyhd88gg4"
    click_button 

    visit('/')
    expect(page).to have_button
    #top post in timeline
    expect(page).to have_content("Peep from: Bloggy_J")
    expect(page).to have_content("Time: 2022-12-01 19:10:25")
    expect(page).to have_content("This is a short post")

    #second post in timeline
    expect(page).to have_content("Peep from: The_Migster")
    expect(page).to have_content("Time: 2022-11-01 14:50:00")
    expect(page).to have_content("Here is a slightly longer peep that I have created")

  end 

  scenario 'not logged in user can see timeline' do 
    visit('/')
    expect(page).to have_no_button
    #top post in timeline
    expect(page).to have_content("Peep from: Bloggy_J")
    expect(page).to have_content("Time: 2022-12-01 19:10:25")
    expect(page).to have_content("This is a short post")

    #second post in timeline
    expect(page).to have_content("Peep from: The_Migster")
    expect(page).to have_content("Time: 2022-11-01 14:50:00")
    expect(page).to have_content("Here is a slightly longer peep that I have created")

  end

end 