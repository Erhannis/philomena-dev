NOTE: I (a newcomer) am writing notes in this document as I learn how the system works.  It will likely be highly incomplete, and somewhat inaccurate.  Assume an implied "I think" in front of each sentence, haha.  I apologize...but don't feel _particularly_ bad, haha.

First off, most of the site is written (mostly?) in Elixir.
It uses Phoenix as a framework.  https://www.phoenixframework.org/
I THINK that when code says e.g. "Philomena.Images.TagValidator", this maps to the file structure under the ./lib directory.


File structure:

./assets/ - frontend data; javascript etc.
./lib/ - backend code
./lib/philomena/ - data model and backend routines and stuff
./lib/philomena/application.ex - application entry point, main file
./lib/philomena_web/ - endpoints, controllers, etc.  The most frontend side of the backend.
./lib/philomena_web/router.ex - configures/lists all the endpoints!
./priv/ - maybe a little more backend code?  And a compiled copy of the frontend data?  Not sure.
./priv/static/system/images - apparently uploaded images get saved here????  Surprising, but I guess it works!



Important endpoints
----
POST /images - upload an image file, or image link



Misc
----
I think that the tokens [:index, :new, :create, :edit, :update, :show, :delete] map to various HTTP methods (POST, GET, etc.).  Not sure if it's automatic or what.
Ecto Changesets are a way of controlling data flowing from external to internal - making sure nobody tries to overwrite fields they shouldn't, etc.
The X_changeset methods are a way of populating and verifying objects from maps, and you can apply multiple of them to deal with multiple aspects of an object.


Tips
----
Try hitting enter a bunch in the logs, to mark your place, then doing an action of interest on the site and see what the logs say happened.



Scratch
----
Image upload process
  pw/c/image_controller.ex:create, -> p/images.ex:create_image


Todo
----
Catch both uploaded images and scraped images
Return result over Channel (websocket)


IEX Debugging
----
I spent like...multiple days trying to get debugging to work.  Here's my notes.
First, follow https://toranbillups.com/blog/archive/2019/04/20/attach-iex-to-running-elixir-inside-docker-container/ .
It's mostly right.  BUT.  First, use "/bin/sh" instead of "/bin/bash".  And, you ALSO need to add your docker node address to /etc/hosts - so like, if your app is c3f2473a1e@3160c633294f, let's call "3160c633294f" your "node name".  When you `exec` into the docker shell, also run `ifconfig` or `ps a` or w/e and copy the non-trivial ip address.  Call that the "node address".  Now, on your host, open /etc/hosts , and add "[node address]<TAB>[node name]", and save the file.  NOW the iex command ought to connect.
...BUT I haven't gotten :debugger.start() to work.  So I switched tacks.
First, I swapped from the alpine linux container to a plain container, while still trying to get the other way working.  Eventually gave up, but haven't switched back.
Following https://stackoverflow.com/questions/16296753/can-you-run-gui-applications-in-a-linux-docker-container , copied most of that stuff into docker/app/Dockerfile, except the stuff about firefox.  I have the run-development file start the VNC server rather than the Philomena server: x11vnc -forever -usepw -create
Then once it's started, I VNC in via the IP address reported by the docker container as above, start `xfwm4 &`, then start the philomena server via `iex -S mix phx.server`, which also gives me an interactive shell.  Running `:debugger.start()` there DOES work!...but I don't see any PIDs or whatever, so further work is likely necessary.
...Turns out I just don't know how to use the debugger:
You gotta do e.g. `:int.ni(Philomena.Images)` in the iex terminal to load the Philomena.Images module into the debugger, or whatever module you want to debug.
Check Auto Attach: On Break to make breakpoints act like you (I) expect.
Step steps into stuff on the current line, Next steps to the next line.
Up and Down merely LOOK one call up or down the stack trace, they do not e.g. execute until function return.
Finish executes until the current function returns.

https://github.com/sass/node-sass/releases/download/v5.0.0/linux-x64-64_binding.node
