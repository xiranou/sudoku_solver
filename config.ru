require 'rubygems'
require 'bundler'
Bundler.require
require 'sass/plugin/rack'

# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

require './app'

run Sinatra::Application