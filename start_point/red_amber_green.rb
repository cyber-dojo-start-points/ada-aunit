
# AUnit's text reporter ends every run with one summary counting the whole
# suite:
#
#   Total Tests Run:   4
#   Successful Tests:  3
#   Failed Assertions: 1
#   Unexpected Errors: 0
#
# The counts are what the colour comes from. The exit status is 1 for a
# failed assertion and 1 for an unexpected error, so it cannot tell those
# apart. The wording does not change with the count, so there is no plural
# to allow for.
#
# A failed Assert is red. An exception a test did not expect is an
# unexpected error, and that is amber, as is a run that never reached the
# summary because cyber-dojo.sh stopped at a compile error.

lambda { |stdout,stderr,status|
  output = stdout + stderr
  count = lambda { |label| output[/^#{label}: +(\d+)\s*$/, 1] }
  run, passed, failed, errors = [
    'Total Tests Run', 'Successful Tests', 'Failed Assertions', 'Unexpected Errors'
  ].map { |label| count.call(label) }
  return :amber if [run, passed, failed, errors].include?(nil)
  return :amber if errors.to_i != 0
  return :red   if failed.to_i != 0
  # Nothing ran, so nothing was proved either way.
  return :amber if run.to_i == 0
  return :green if passed == run
  return :amber
}
