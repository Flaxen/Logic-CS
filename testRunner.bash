
for file in tests/*; do
	prolog -q -l tests/testRunner.pl "tests/$(basename "$file")"
done
