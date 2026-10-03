set -e

cat <<'EOF'
AUnit test rules:
  A test package runs only once test_runner.adb adds it to the suite.
  So when you add one, add it there, as Hiker_Tests is.

EOF

# --------------------------------------------------------------
# Every .ads and .adb file is compiled, at any depth, whether or not
# test_runner.adb reaches it yet. A file you are partway through writing then
# reports its mistake, naming the file, line, and column, rather than being
# passed over because nothing uses it.
#
# Everything gprbuild writes goes to /tmp/obj, outside your files.
GPRBUILD_OPTS=()
GPRBUILD_OPTS+=(-q)              # only what goes wrong, not each step
GPRBUILD_OPTS+=(-p)              # create /tmp/obj
GPRBUILD_OPTS+=(-P tests.gpr)

gprbuild "${GPRBUILD_OPTS[@]}" -c -U        # compile every source
gprbuild "${GPRBUILD_OPTS[@]}"              # bind and link test_runner

# --------------------------------------------------------------
# All your tests run in ONE process, which prints one summary counting every
# test in the suite.
/tmp/obj/test_runner
