p
s/^B*\([^:B]*\)B*$/firstMinus:B@\1B/
:loop
s/:@/:B@/g
s/@$/@B/
p
s/^firstMinus:\(.*\)@1\(.*\)$/firstMinus:\11@\2/;t loop
s/^firstMinus:\(.*\)@-\(.*\)$/rightDigit:\1-@\2/;t loop
s/^rightDigit:\(.*\)@-\(.*\)$/rightDigit:\1-@\2/;t loop
s/^rightDigit:\(.*\)\(.\)@1\(.*\)$/leftDigit:\1@\2-\3/;t loop
s/^rightDigit:\(.*\)\(.\)@B\(.*\)$/cleanUp:\1@\2B\3/;t loop
s/^leftDigit:\(.*\)\(.\)@-\(.*\)$/leftDigit:\1@\2-\3/;t loop
s/^leftDigit:\(.*\)@1\(.*\)$/rightDigit:\1-@\2/;t loop
s/^cleanUp:\(.*\)\(.\)@-\(.*\)$/cleanUp:\1@\2B\3/;t loop
s/@//
s/^[^:]*:B*\([^B]*\)B*$/\1/
