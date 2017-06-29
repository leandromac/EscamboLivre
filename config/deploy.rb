# config valid only for current version of Capistrano
lock "3.8.2"

set :application, "EscamboLivre"
set :branch, "master"
set :repo_url, "https://github.com/leandromac/EscamboLivre.git"
set :deploy_to, "/var/www/escambolivre"
set :keep_releases, 5
set :format, :airbrussh
set :log_level, :debug
append :linked_files, "config/database.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }
