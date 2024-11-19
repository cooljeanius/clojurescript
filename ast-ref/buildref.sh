#!/bin/sh

java -cp .:"$(lein cp)" clojure.main <<EOF
 (load "gen-ref")
 (System/exit 0)
EOF

if test -n "${DO_COMMENTED_OUT_JUNK}" && test "${DO_COMMENTED_OUT_JUNK}" = "YES"; then
  if test -x "$(which git)" && test -d .git && test -r .git; then
    git pull
    if test -r quickref.html && test ! -e q.html && test -w .; then
      mv quickref.html q.html
    fi
    git checkout origin/gh-pages
    if test -r q.html && test ! -e q.html && test -w .; then
      mv q.html quickref.html
    fi
    if test -r quickref.html; then
      git add quickref.html
      git commit -m "update quickref"
    fi
    git push origin HEAD:gh-pages
    git checkout master
  fi
fi
