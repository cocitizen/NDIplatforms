NDI Platforms Documentation
===========================

We maintain the NDIplatform documentation site using
[mkdocs](http://www.mkdocs.org/) to build this site. To get started
contributing to this project, fork it on Github. Then install mkdocs and clone
this repo:

    :::bash
    $ sudo brew install python              # For OSX users
    $ sudo aptitude install python-pip      # For Debian/Ubuntu users
    $ sudo pip install mkdocs
    $ git clone https://github.com/NDItech/NDIplatforms.git
    $ cd NDIplatforms
    $ git remote add sandbox https://github.com/<username>/NDIplatforms.git
    $ mkdocs serve

Your local NDIplatforms docs site should now be available for browsing:
[http://127.0.0.1:8000/](http://127.0.0.1:8000/). When you find a typo, an error, unclear or missing
explanations or instructions, hit ctrl-c, to stop the server, and start
editing. Find the page you’d like to edit; everything is in the docs/
directory. Make your changes, commit and push them, and start a pull request:

    $ git checkout -b fix_typo
    $ vim docs/index.md                     # Add/edit/remove whatever you see fit. Be bold!
    $ mkdocs build --clean; mkdocs serve    # Go check your changes. We’ll wait...
    $ git diff                              # Make sure there aren’t any unintended changes.
    diff --git a/docs/index.md b/docs/index.md
    ...
    $ git commit -am”Fixed typo.”           # Useful commit message are a good habit.
    $ git push sandbox fix_typo

Visit your fork on Github and start a Pull Request.
