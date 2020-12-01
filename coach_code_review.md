## Coach code review from Eoin Power 27/11/2020

Well done on your Chitter challenge, I think you did very well with the features that you implemented, and demonstrated the learning objectives of the week super well! I have a couple of notes here:

Really great readme, super useful context to share, definitely keep this up! ~~One addition could be a screenshot of the app in action, and a snapshot of test coverage.~~


~~Might be good to check for more content than the peep’s script for your peep posting feature test: for example, if the post happened to fail, the test could still pass from the form that the test has filled out with the script.~~


~~You could also stub Time and check to see if that was posted successfully, or anything else that may be appearing on the screen other than the peep script itself.~~


~~It’s best to avoid relying on Time.now in your tests - the reason for that is that in more complex examples / projects there’s a chance that when it comes to making a comparison between the time something was created and the time you expected to be displayed, it may differ. You can stub a response from Time.now instead, to make sure it always stays the same but that the behaviour is carried out in the same way. This is something to note for your first practice tech test in week 10!~~


new.erb: the filename could be a little bit more descriptive of the view you’re implementing here


Oh and one other small thing - it may make the call to create a new Peep a little bit neater if you were to pass all of the params through at once rather than individually for username, etc.
