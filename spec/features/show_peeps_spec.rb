require_relative "../../app/app.rb"


feature "User can create a new message" do
  scenario "Submission form has a submit button" do
    visit('/new_message')

    expect(page).to have_button('Submit')
  end


  scenario "User fills message form and submits" do
    sign_up
    visit('/new_message')
    fill_in "message", with: "Today is a sunny day and I will spend the whole day coding #HappyCodingDay"
    click_button "Submit"

    expect(current_path).to eq('/peeps')

    within 'ul#peeps' do
      expect(page).to have_content('Today is a sunny day and I will spend the whole day coding #HappyCodingDay')
    end
  end

  scenario "Check time when peep has been sent" do
    sign_up
    visit('/peeps')
    click_link "Create new message"

    fill_in "message", with: "Today is a sunny day and I will spend the whole day coding #HappyCodingDay"

    click_on "Submit"

    expect(current_path).to eq('/peeps')
    within 'ul' do
      expect(page).to have_content('Sent at:')
    end
  end

end

def sign_up
  visit('/sign_up')
  fill_in "email", with: "v.r@gmail.com"
  fill_in "password", with: "1234"
  fill_in "name", with: "valentina"
  fill_in "username", with: "vale"
  click_button "Submit"
end
