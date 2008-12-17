Dir[File.join(File.dirname(__FILE__), '../lib')].each do |path|
  $LOAD_PATH.unshift path
end

require 'erb'

require 'karl/version'

require 'karl/widget'
require 'karl/frame'
require 'karl/button'
require 'karl/callback'
require 'karl/alert'
