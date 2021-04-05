# Popular Movies App
*This app is still under-construction*
<img src="https://media.giphy.com/media/2T3nF5O8baoOndGWAz/giphy.gif" width="300" align="right" hspace="20">

This is a Flutter Mobile app built using the MovieDb Api

## Architecture
* The app only has a presentation layer which contains the UI, Business Logic and Services
* The views are dumb and are given their data via what I'm calling ViewModels
* As the Flutter UI is declarative it is ok to destroy and recreate the screen multiple times, there isn't any true benefit to preventing some elements from recreating, with this in mind the screen always recreates when an interaction occurs, as long as you are keeping reference to the state of the screen it will recreate seamlessly for the user.
