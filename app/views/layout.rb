<!DOCTYPE html>
<html>
  <head>
    <title>Bookmark Manager</title>
  </head>

  <body>
    <% if current_user %>
      Welcome, <%= current_user.email %>
    <% end %>
    <%= yield %> 
  </body>
</html>
