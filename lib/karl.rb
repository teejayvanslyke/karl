Dir[File.join(File.dirname(__FILE__), '../lib')].each do |path|
  $LOAD_PATH.unshift path
end

require 'rubygems'
gem     'activesupport'
require 'activesupport'

require 'erb'

require 'string_to_proc'

require 'karl/version'

require 'karl/widget'
require 'karl/stack'
require 'karl/flow'
require 'karl/frame'
require 'karl/button'
require 'karl/text_field'

