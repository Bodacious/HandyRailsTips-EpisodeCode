require "benchmark"

require_relative "random_ref"
require "securerandom"

TIMES_RUN = 10_000

Benchmark.bmbm do |test|
  test.report("SecureRandom hex:") { TIMES_RUN.times { SecureRandom.hex(5).upcase } }
  test.report("SecureRandom alpha:") { TIMES_RUN.times { SecureRandom.alphanumeric(10).upcase } }
  test.report("RandomRef:") { TIMES_RUN.times { RandomRef.new.to_s } }
end
