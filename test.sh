#!/bin/bash
#!/bin/bash

empty=$(rm calculator || true)
$(make calculator)

test(){
output=$(./calculator $1)
if [ "$output" = "$2" ]; then
    echo "Testing $1...Ok."
else
    echo "Error: calculating $1 gave us $output, $2 expected."
fi
}

echo "--------------------------"
echo "Running tests..."
echo "--------------------------"
test "2*2" "4.000000"
test "(2*2)+2" "6.000000"
test "-4*2" "-8.000000"
test "(4*(4*4))" "64.000000"
test "-(4*4)" "-16.000000"
test "(2*2)(2*2)" "16.000000"
test "((4+4)" "Error: 1 parenthesis never closed."
test "((4+4))))" "Error: -2 parenthesis never closed."
test "4++4" "Error: two operators without a value between them."
test "4+4/2(5*2)" "24.000000"
test "4+4/(2(10))" "4.200000"