require 'test/unit'
require 'rubygems'

require 'active_support'

require 'active_record'

#just requiring active record wasn't loading classes soon enough for SILENT_EXCEPTIONS
ActiveRecord::Base

require 'action_controller'
require 'action_controller/test_case'
require 'action_controller/test_process'

#just requiring action controller wasn't loading classes soon enough for SILENT_EXCEPTIONS
ActionController::Base

RAILS_ROOT = '.' unless defined?(RAILS_ROOT)
RAILS_ENV = 'test'

require File.join(File.dirname(__FILE__), "..", "init")

ExceptionNotifier.configure_exception_notifier do |config|
  # If left empty web hooks will not be engaged
  config[:web_hooks]                = []
  config[:exception_recipients]     = ["test.errors@example.com"]
  config[:view_path]                = File.join(File.dirname(__FILE__), "mocks")
end
