#!/usr/bin/env bash
# Markdown-wdiff -- format diff of Markdown files with decoration
# Usage:
#     wdiff old.md new.md | markdown-format-wdiff
#     git diff --word-diff origin/master -- README.md docs/tutorial/README.md | markdown-format-wdiff
#
# Author: Jaeho Shin <netj@cs.stanford.edu>
# Created: 2013-11-18
set -eu

# word diff the given unified diff as input, and format it by hunks
sed '
# format ins/del of words
s/\[\-/<del class="del">/g; s/\-]/<\/del>/g
s/{\+/<ins class="ins">/g; s/\+}/<\/ins>/g
'

# attach a small stylesheet
echo '
<style>
    .del,.ins{ display: inline-block; margin-left: 0.5ex; }
    .del     { background-color: #fcc; }
         .ins{ background-color: #cfc; }
</style>
'