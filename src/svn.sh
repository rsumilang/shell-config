#!/usr/bin/env bash

#
# SVN Helpers
#

# SVN Repo
# - Returns repo name of current working directory project
function svnrepo() {
 svn info | grep 'Repository Root' | awk '{print $NF}'
}

# SVN Switch
# - Repository root is automagically figured out by current working directory.
# - Expects a single argument. Ie: trunk or branches/123-foo-bar or tags/0.0.1
function svnswitch {
 svn switch $(svnrepo)/$1
}

# SVN Merge
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
# - Creates a branch/tag from trunk
# - Expects branch name. Ie: 123-ticket
function svnbranch {
 svn copy $(svnrepo)/trunk $(svnrepo)/branches/$1
}

