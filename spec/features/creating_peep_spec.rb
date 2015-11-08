feature "creating a peep" do

  let(:user) do
    user = User.create(email: 'coco@gmail.com',
                  password: 'lila',
                  password_confirmation: 'lila',
                  name: 'Julien',
                  user_name: 'coco')
  end

  scenario "as a signed in user" do
    expect{create_peep(email: user.email,password: user.password,content: 'Nadal just won the Roland Garros final')}.to change(Peep, :count).by(1)
    expect(page).to have_content('Nadal just won the Roland Garros final')
    expect(page).to have_content(user.name)
    expect(page).to have_content(Time.new.strftime("Sent on %d/%m/%Y at %I:%M%p"))
  end
end
