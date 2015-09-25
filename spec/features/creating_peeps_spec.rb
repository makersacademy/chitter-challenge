feature 'Creating and posting peeps' do
  
  scenario 'can create peep once logged in' do
    user = create :user
    sign_in(user)
    visit '/peeps/new'
    fill_in 'peep', with: "The first peep"
    click_button 'Post'
    expect(Peep.count).to eq(1)
  end

  scenario 'peep field must be filled in' do
    user = create :user
    sign_in(user)
    visit '/peeps/new'
    click_button 'Post'
    expect(Peep.count).to eq(0)
    expect(page).to have_content("No message entered")
  end

  scenario 'user must be signed in before peeping' do
    visit '/peeps/new'
    fill_in 'peep', with: "The first peep"
    click_button 'Post'
    expect(page).to have_content("You are not signed in")
  end
end