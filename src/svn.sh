#!/usr/bin/env bash

#
# SVN Helpers
#

# vim will be the default editor if it exists and $SVN_EDITOR is not yet
if [ "$SVN_EDITOR" == "" ]; then
  command -v vim 2>&1 > /dev/null
  if [ "$?" == "0" ]; then
    export SVN_EDITOR="vim"
  fi
fi

# SVN Repo
# - Returns repo name of current working directory project
function svnrepo() {
 svn info | grep 'Repository Root' | awk '{print $NF}'
}

# SVN Delete
# - Repository root is automagically figured out by current working directory.
# - Expects a single argument. Ie: branches/123-foo-bar
function svndelete {
 svn delete $(svnrepo)/$1
}

# SVN Switch
# - Repository root is automagically figured out by current working directory.
# - Expects a single argument. Ie: trunk or branches/123-foo-bar or tags/0.0.1
function svnswitch {
 svn switch $(svnrepo)/$1
}

# SVN Copy
# - Repository root is automagically figured out by current working directory.
# - Expects two arguments. From and to path relative to repositor root. Ie: `svncopy trunk branches/123-foo-bar`
function svncopy {
 svn copy $(svnrepo)/$1 $(svnrepo)/$2
}

# SVN Merge
# - Repository root is automagically figured out by current working directory.
# - Expects a single argument. Ie: trunk or branches/123-foo-bar or tags/0.0.1
function svnmerge {
 svn merge $(svnrepo)/$1
}

# SVN Branch
# - Creates a branch/tag from trunk. Svn switch will be called automatically to the new path.
# - Expects branch name. Ie: branches/123-ticket
function svnbranch {
 svn copy $(svnrepo)/trunk $(svnrepo)/$1
 svnswitch $1
}

