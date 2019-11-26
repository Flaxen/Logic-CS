testCount=0
passCount=0

for file in tests/*.txt; do testCount=$((testCount+1))

	if [[ $file == *"invalid"* ]] || [[ $file == *"Invalid"* ]]; then

		variable=`prolog -q -l tests/testRunner.pl "tests/$(basename "$file")" invalid`
	else
		variable=`prolog -q -l tests/testRunner.pl "tests/$(basename "$file")" valid`
	fi

	if [[ $variable == *"passed"* ]]; then
		passCount=$((passCount+1))
	fi

	echo $variable
done

	echo ""
	echo Tests executed: $testCount
	echo Tests passed: $passCount
  echo Tests failed: $((testCount-passCount))
