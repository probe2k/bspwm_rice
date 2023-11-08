;extends

; String
;(((string) @string (#offset! @string 0 1 0 -1)) (#set! conceal ""))

; Import Statements
((import_statement "import" @include) (#set! conceal ""))
((import_from_statement "import" @include) (#set! conceal ""))

; Math Operators
((binary_operator operator: "/" @operator) (#set! conceal "÷"))
((binary_operator operator: "*" @operator) (#set! conceal "×"))

; Comparison Operators
((comparison_operator operators: ">=" @TSOperator) (#set! conceal "⩾"))
((comparison_operator operators: "<=" @TSOperator) (#set! conceal "⩽"))
((comparison_operator operators: "!=" @TSOperator) (#set! conceal "≢"))
((comparison_operator operators: "==" @TSOperator) (#set! conceal "＝"))
((comparison_operator operators: "in" @keyword.operator) (#set! conceal "󰬰"))
; ((comparison_operator operators: "not in" @keyword.operator) (#set! conceal "∉"))
((not_operator "not" @keyword.operator) (#set! conceal "￢"))

; Functions
((lambda "lambda" @keyword.function) (#set! conceal "λ"))
((function_definition "def" @keyword.function) (#set! conceal " "))
((function_definition "->" @operator) (#set! conceal ""))
((function_definition body: (block (return_statement "return" @keyword.return))) (#set! conceal "󰌑"))
((function_definition parameters: (parameters (identifier) @parameter (#eq? @parameter "self"))) (#set! conceal "󰰣"))
((attribute object: (identifier) @variable (#eq? @variable "self")) (#set! conceal "󰰣"))
;((function_definition body: (block . (expression_statement (string) @string))) (#set! conceal " "))

; Classes
((class_definition "class" @keyword) (#set! conceal " "))
