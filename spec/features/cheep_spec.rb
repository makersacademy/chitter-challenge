feature "Viewing Cheeps" do

  scenario "I can see existing cheeps on the homepage" do
    Cheep.create(cheep: "This is a test", time: Time.now)
    visit('/cheeps')
    expect(page.status_code).to eq 200

    within "ul#cheeps" do
      expect(page).to have_content("This is a test")
    end
  end
end

feature 'Creating cheep' do

  let!(:user) do
    User.create(user_name: 'Dave',
    password: 'password1')
  end

  scenario 'I can create a new cheep' do
    sign_up
    fill_in :cheep,   with: "This is a test2"
    click_button 'Cheep Cheep!'

    expect(current_path).to eq '/cheeps'
    expect(page).to have_content('This is a test2')
  end
end
