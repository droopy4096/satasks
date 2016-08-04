satasks
=======

Sysadmin tasks

The problem
-----------

As a sysadmin I have tons of tasks on the go. Most of them originate from tickets. Most of them require several terminal sessions. Using terminal tabs becomes difficult rather fast. Also having to shut all the sessions as you log out sometimes is not viable. So naturally you want to organize yourself with "screen"

Solution
--------

For each task we need to create it's "work directory" and a screen session. "t" is the command to do both::

  $ t TICKET123 "Change proxy settings for a server"

then when you'd like to see tasks currently worked on::

  $ task_list
  TICKET123 Change proxy settings for a server

"t" is fairly intelligent and will connect to existing screen session with TICKET123 name instead of spawning new one if that is possible.
