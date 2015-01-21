$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'watir_performance'
require 'watirmark'
require 'watirmark/configuration'
require 'headless'

SHORT_URL="file://"+File.dirname(__FILE__) + "/html/short.html"
LONG_URL="file://"+File.dirname(__FILE__) + "/html/long.html"
NESTED_URL="file://"+File.dirname(__FILE__) + "/html/nested.html"
