require 'simplecov'
SimpleCov.profiles.define 'no_vendor_coverage' do
  add_filter 'vendor' # Don't include vendored stuff
end

# save to CircleCI's artifacts directory if we're on CircleCI
if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start 'no_vendor_coverage'

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'linked_list_tail'

