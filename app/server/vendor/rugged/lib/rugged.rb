begin
  RUBY_VERSION =~ /(\d+.\d+)/
  require "rugged/#{$1}/rugged"
rescue LoadError
  # Start modifications
  #
  # Original code:
  begin
    require "rugged/rugged"
  rescue LoadError

    # Modifications made for Sonic Pi multi-platform compatibility:
    require 'rbconfig'
    ruby_api = RbConfig::CONFIG['ruby_version']
    os = case RUBY_PLATFORM
         when /.*arm.*-linux.*/
           :raspberry
         when /.*linux.*/
           :linux
         when /.*darwin.*/
           :osx
         when /.*mingw.*/
           :windows
         else
           RUBY_PLATFORM
         end
    require_relative "../../../rb-native/#{os}/#{ruby_api}/rugged"
  end
  # End modifications
end
require 'rugged/index'
require 'rugged/object'
require 'rugged/commit'
require 'rugged/version'
require 'rugged/repository'
require 'rugged/reference'
require 'rugged/walker'
require 'rugged/tree'
require 'rugged/tag'
require 'rugged/branch'
require 'rugged/diff'
require 'rugged/patch'
require 'rugged/remote'
require 'rugged/credentials'
