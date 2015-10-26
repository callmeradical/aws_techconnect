aws s3 sync $BUCKET photos/
bundle exec jekyll build
aws s3 sync _site $SITE
