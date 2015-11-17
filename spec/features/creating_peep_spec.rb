feature "creating a peep" do

  let(:user) do
    user = User.create(email: 'coco@gmail.com',
                  password: 'lila',
                  password_confirmation: 'lila',
                  name: 'Julien',
                  user_name: 'coco')
  end

  before do
    Timecop.freeze(Time.local(2015))
  end

  after do
    Timecop.return
  end

  scenario "as a signed in user" do
    expect{create_peep(email: user.email,password: user.password,content: 'Nadal won the final')}.to change(Peep, :count).by(1)
    expect(page).to have_content('Nadal won the final')
    expect(page).to have_content(user.name)
    expect(page).to have_content("Sent on 01/01/2015 at 12:00AM")
  end
end
