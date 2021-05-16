NOTE: I (a newcomer) am writing notes in this document as I learn how the system works.  It will likely be highly incomplete, and somewhat inaccurate.  Assume an implied "I think" in front of each sentence, haha.  I apologize...but don't feel _particularly_ bad, haha.

First off, most of the site is written (mostly?) in Elixir.
It uses Phoenix as a framework.  https://www.phoenixframework.org/


File structure:

./assets/ - frontend data; javascript etc.
./lib/ - backend code
./lib/philomena/ - data model and backend routines and stuff
./lib/philomena_web/ - endpoints, controllers, etc.  The most frontend side of the backend.
./priv/ - maybe a little more backend code?  And a compiled copy of the frontend data?  Not sure.
