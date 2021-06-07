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


Tips
----
Try hitting enter a bunch in the logs, to mark your place, then doing an action of interest on the site and see what the logs say happened.



Scratch
----
Image upload process
  pw/c/image_controller.ex:create, -> p/images.ex:create_image