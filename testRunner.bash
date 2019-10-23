
for file in tests/*.txt; do
	prolog -q -l tests/testRunner.pl "tests/$(basename "$file")"
done
