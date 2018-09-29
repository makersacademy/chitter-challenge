Chitter Challenge
=================

```

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

```

When the user visits the '/Chitter ' path, their browser sends a request to a controller we built.
When the controller gets the request, it asks the Chitter class to give it all the messages, (.all)
The Chitter class goes and gets the messages, and gives back all the messages in an array to the controller.
The controller renders the array of messages to a webpage, which it sends as a response to the user

In this user story I will build the following:
A Controller
A Chitter class
A messages view

![image](https://user-images.githubusercontent.com/24396579/46244206-46508d00-c3d3-11e8-84ba-1937f9cee830.png)
