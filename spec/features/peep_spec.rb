feature "Peeps" do

  scenario 'peeps/new loads correctly' do
    visit '/peeps/new'
    expect(page.status_code).to eq 200
  end

  scenario 'can be created when logged in' do
    user = create_user
    sign_in(user)
    visit '/peeps/new'
    fill_in :content, with: "My first peep"
    click_button 'PEEP'
    expect(page).to have_content "My first peep"
  end

  scenario 'cannot be made when not logged in' do
    visit '/peeps/new'
    expect(page).to have_content "You must be logged in to create peeps"
  end


end