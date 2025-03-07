#!/bin/bash
set -e

# Railsアプリケーションが存在しない場合は新規作成
if [ ! -f ./config/application.rb ]; then
  bundle exec rails new . --force --database=sqlite3 --skip-bundle
  bundle install
fi

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
