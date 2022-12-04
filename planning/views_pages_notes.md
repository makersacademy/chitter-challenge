index:

      # <%= if logged_in == false %>
        <nav>
          <a href="/">Home</a> |
          <a href="/login">Log in</a> |
          <a href="/signup">Sign up</a>
        </nav>
      # <% elsif logged_in == true %>
        # <nav>
        #   <a href="/">Home</a> |
        #   <a>Signed in as @user.username</a> |
        #   <a href="/logout">Log out</a>
        # </nav>
      # <% end %>
    </header>