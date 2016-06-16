# Conversations Between Users (1-to-1) with Devise and ActionCable

This app has the following features:

* User management
* 1-to-1 threaded chat (like on Facebook/LinkedIn)
* Notifications about incoming messages powered by ActionCable. So basically when a user receives
a message, a notification appears at the bottom of the page with an actual text and a link to the
conversation (thread)

Based on another tutorial on creating [chat application with rooms](https://github.com/bodrovis-learning/actioncable_devise_demo),
so for more details about the ActionCable setup and deploying to Heroku refer to the README of that app.

Models:

$ rails g model Conversation author_id:integer:index receiver_id:integer:index
$ rails g model PersonalMessage body:text conversation:references position:integer:index user:references

Gems:

* Redis
* Devise
* Acts_as_list

## Copyright

(c) 2016 [Ilya Bodrov](http://ilyabodrov.me)