Sketched out rough domain model on paper
Reviewed the task description and review.md file
Decided to start with messages and time stamps
Adding user functionality later
Not clear on the difference between sign up and log in 
Then got server up and running
2 hour blocker - couldn't see the server output, couldn't run ruby app.rb
Eventually was fixed, but I didn't actually change anything or do anything new, I don't think

<%= @all_messages.content.each { |message| print message } %>
<%= @messages.map { |x| x.content }%>

Not sure what to do next
Implementing users involves sessions
Will have to go back and review how sessions work
But the subsequent code also uses exec_params
Would be better to review and implement exec_params
before implementing users, as the walkthroughs will be
easier to follow