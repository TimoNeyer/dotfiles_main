; Keywords
["def" "end" "method" "self"] @keyword

; Strings
(string_literal) @string
(documentation) @comment

; Numbers
(number_literal) @number

; Comments
(comment) @comment

; Identifiers
(class_name) @type
(identifier) @variable

; Operators
["=" ":" "->"] @operator

; Delimiters
["(" ")" "[" "]" "<" ">" ";"] @punctuation.delimiter
