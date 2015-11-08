feature "signing out" do

  before(:each) do
    User.create(email: 'coco@gmail.com',
                  password: 'lila',
                  password_confirmation: 'lila',
                  name: 'Julien',
                  user_name: 'coco')
  end

  scenario "while user signed in" do
    sign_in(email: 'coco@gmail.com', password: 'lila')
    click_button('Sign out')
    expect(page).to have_content('Goodbye, coco')
    expect(page).not_to have_content('Welcome, coco')
  end
end
