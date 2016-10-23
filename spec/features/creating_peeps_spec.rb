feature "Creating peeps" do

  let!(:user) do
    User.create(email: 'user@example.com',
                name: "H Houdini Esq",
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario "I can create a new peep" do
    sign_in(email: user.email, password: user.password)
    visit '/peeps/new'
    fill_in 'Message', with: "This is my first peep! I'm so friggin' excited!!!"
    click_button 'Peep this!'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is my first peep!'
  end
end
