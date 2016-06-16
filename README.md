# Conversations Between Users (1-to-1) with Devise and ActionCable

**WIP**

Based on another tutorial on creating [chat application with rooms](https://github.com/bodrovis-learning/actioncable_devise_demo).

Models:

$ rails g model Conversation author_id:integer:index receiver_id:integer:index
$ rails g model PersonalMessage body:text conversation:references position:integer:index user:references

Gems:

* Redis
* Devise
* Acts_as_list

## Copyright

(c) 2016 [Ilya Bodrov](http://ilyabodrov.me)