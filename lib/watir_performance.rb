require "watir_performance/version"
require "watir_performance/locator_runs"
require "watir_performance/results"
require "benchmark"
include Benchmark

require 'descriptive_statistics'
DescriptiveStatistics.empty_collection_default_value = 0.0


