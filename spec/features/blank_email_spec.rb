feature "invalid email" do

  scenario "can't create blank email address" do
    expect{ sign_up(email: nil)}.not_to change(User, :count)
    expect(current_path).to eq('/sign-up')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "can't create invalid email address" do
    expect{ sign_up(email: 'coco@coco')}.not_to change(User, :count)
    expect(current_path).to eq('/sign-up')
    expect(page).to have_content('Email has an invalid format')
  end

end
