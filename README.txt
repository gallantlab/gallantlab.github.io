# INSTRUCTIONS AS OF 31 MARCH 2023
# You need to have nikola installed on your system in order
# to build the site locally, and to check it before you
# push to github. To install, follow the instructions here:
#  https://getnikola.com/getting-started.html

# This directory contains several subdirectories:
#  gallantlab: the web site
#  nikola: the nikola site building software
#  BACKUP.restful.pages.30Mar2023: backup of old stuff

# To get into the working web site directory
cd gallantlab

# To build the site locally and display it on your browser
nikola build
nikola serve --browser

# To push it to github
git add .      # Adds any new files that you made
git commit     # Commits to the repository
git push       # Uploads to github

# Be SURE to check github to make sure that the redirect
# works properly. Go into Settings->Pages->Custom Domain
# and enter gallantlab.org there. To prevent interruption
# try to do this BEFORE the site finishes building.
