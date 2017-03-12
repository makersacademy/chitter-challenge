feature "#Peep" do

  let!(:maker) do
    Maker.create( full_name: "maker makerson",
                  user_name: "maker",
                  email: "maker@example.com",
                  password: "secret1234",
                  password_confirmation: "secret1234")
                end

  scenario "posting a peep while logged in" do
    log_in(email: maker.email, password: maker.password)
    fill_in :peep, with: "test content"
    click_button("Peep")
    expect(current_path).to eq('/')
    expect(page).to have_content("test content")
    expect(page).to have_content("Peeped by #{maker.user_name}.")
  end
end
