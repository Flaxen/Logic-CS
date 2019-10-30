
for file in tests/*.txt; do

	if [[ $file == *"invalid"* ]] || [[ $file == *"Invalid"* ]]; then

		variable=`prolog -q -l tests/testRunner.pl "tests/$(basename "$file")" invalid`
	else
		variable=`prolog -q -l tests/testRunner.pl "tests/$(basename "$file")" valid`
	fi
	echo $variable
done
