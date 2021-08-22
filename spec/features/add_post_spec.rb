feature "Redirects user to add a post page" do 
  scenario "User clicks add post button" do 
    visit "/"
    click_button('Add post')
    expect(page).to have_current_path('/add_post')
    expect(page).to have_content("Add your post to the text box below")
  end 
end

#this test is an edge case incase user enters a nothing into text box ans presses submit 
feature "Checking user enters new 'cheet' into form correctly" do 
  scenario "User clicks add post button with NO text entered" do 
    visit "/add_post"
    fill_in("post", with: "")
    click_button('Submit cheet')
    expect(page).to have_current_path('/add_post')
  end 

  scenario "User clicks add post button with text entered" do 
    visit "/add_post"
    fill_in("post", with: "Good morning world !")
    click_button('Submit cheet')
    expect(page).to have_content("Good morning world !")
  end

end 
