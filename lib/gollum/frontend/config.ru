#!/usr/bin/ruby
require 'rubygems'
require '/home/git/gollum/lib/gollum/frontend/app'

system("which git") or raise "Looks like I can't find the git CLI in your path.\nYour path is: #{ENV['PATH']}"

gollum_path = '/home/git/git_repo' # CHANGE THIS TO POINT TO YOUR OWN WIKI REPO

disable :run

configure :development, :staging, :production do
 set :raise_errors, true
 set :show_exceptions, true
 set :dump_errors, true
 set :clean_trace, true
end

$path = gollum_path
Precious::App.set(:gollum_path, gollum_path)
Precious::App.set(:wiki_options, {})

run Precious::App
