feature "Peeps page displays all peeps" do
  scenario "Go to peeps page and view peeps in reverse chronological order" do
    create_user_and_post_peeps
    visit('/peeps')
    expect(page.status_code).to eq 200
    expect('second').to appear_before('first')
  end
end

feature "Registration/sign_up" do
  scenario "Fill in the form and see welcome massage" do
    sign_up
    expect(page).to have_content('Oleg Gru')
  end
end

feature "Submit peep" do
  scenario "Fill in the form to send the peep and display it" do
    sign_up
    visit('/peeps')
    fill_in('new_peep', with: 'Hello World')
    click_button 'Post'
    expect(page).to have_content('Hello World')
  end
end
