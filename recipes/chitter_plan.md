# Modelling and Planning for Chitter Challenge 

## Step 0: User stories or specification

> As a Maker
> So that I can let people know what I am doing  
> I want to {post} a message ([peep]) to chitter

> As a maker
> So that I can see what others are saying  
> I want to {see} all peeps in [reverse chronological order]

> As a Maker
> So that I can better appreciate the context of a peep
> I want to see the [time] at which it was made

> As a Maker
> So that I can post messages on Chitter as me
> I want to {sign up} for Chitter

>- As a Maker
>- So that only I can post messages on Chitter as me
>- I want to {log in} to Chitter

>- As a Maker
>- So that I can avoid others posting messages on Chitter as me
>- I want to {log out} of Chitter

>* As a Maker
>* So that I can stay constantly tapped in to the shouty box of Chitter
>* I want to {receive an email} if I am [tagged] in a Peep

## Step 1: Planning pages

Adopt the perspective of a user browsing your website. Pages - Links - Forms

![](./images/../../images/chitter_design.png)

## Step 2: Planning routes

Remember that a web application flow is all based on the HTTP request-response cycle.

* GET (/) [index.erb] displays peeps plus link buttons to register, login, logout and new peeps.
* GET (register/new) [register.erb] displays a register form and links to login and homepage via cancel button.
* POST (register) validates new user and redirects to the homepage logged in or returns back to [register.erb].
* GET 

 * A page (such as the home page) is usually returned by a `GET` route. For example, the
   home page (which is almost always the first route you'll start with), is usually `GET
   /`.
 * If the user navigates to a different page using a link, you will need a `GET` route for
   this other page.
 * If the user submits a form that leads to a different page, you will need a `POST` route
   to submit this form to.

From the pages planned above, here are the routes we could plan. Once again, this is only
a possible list of routes for this case — you could come up with slightly different ones,
which would still satisfy the initial user stories.

```md
# Page: list of entries (aka the homepage)

## Request:
GET /
No parameters

## Response (200 OK)
HTML view with list of entries
```

```md
# Page: see full entry 

## Request:
GET /entries/:id
With path parameter :id

## Response (200 OK)
HTML view with details of a single entry
```

```md
# Page: add a new entry

## Request:
GET /entries/add
No parameters

## Response (200 OK)
HTML view with form to submit new entry (to POST /entries)
```

```md
# Page: new entry added

## Request:
POST /entries
With parameters:
  title="What a great Sunday"
  content="..."

## Response (200 OK)
HTML view with confirmation message
```

## Step 3: Test-drive and implement

You'll now test-drive and implement each route. If your application interacts with a
database to store its data, you'll also have to test-drive and implement other layers of
the program (such as Repository classes) as part of your work.

## Challenge

Model and plan the pages and routes for the following web application, which is a game of
Rock Paper Scissors. Test-drive and implement it if you'd like an extra challenge.

```
As a Maker
So I can play Rock Paper Scissors
I would like to enter my move on the home page
And click to confirm my move (rock, paper or scissors)

As a Maker
So I can play Rock Paper Scissors
I would like the opponent's move to be decided randomly by the program

As a Maker
So I can play Rock Paper Scissors
I would like to see the result of the game on the next page

As a Maker
So I can play Rock Paper Scissors again
I would like to click on a link on the result page
So it takes me back to the home page
```


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=pills%2Fmodelling_and_planning_web_application.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=pills%2Fmodelling_and_planning_web_application.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=pills%2Fmodelling_and_planning_web_application.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=pills%2Fmodelling_and_planning_web_application.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=pills%2Fmodelling_and_planning_web_application.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->