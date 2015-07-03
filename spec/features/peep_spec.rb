feature "Peeps" do

  scenario 'peeps/new loads correctly' do
    visit '/peeps/new'
    expect(page.status_code).to eq 200
  end

  scenario 'can be created when logged in' do
    user = create_user
    sign_in(user)
    visit '/peeps/new'
    fill_in :peep, with: "My first peep"
    click_button 'PEEP'
    expect(page).to have_content "My first peep"
  end

end