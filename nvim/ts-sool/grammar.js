module.exports = grammar({
  name: 'toy_lang',

  rules: {
    source_file: $ => seq(
      optional($.compiler_info),
      repeat($.class_definition)
    ),

    compiler_info: $ => seq(
      '[',
      optional($.compiler_directives),
      ']',
      ';'
    ),

    compiler_directives: $ => sep1($.compiler_directive, ';'),

    compiler_directive: $ => choice(
      $.exports_directive,
      $.imports_directive
    ),

    exports_directive: $ => seq(
      'exports',
      '=',
      $.identifier_list
    ),

    imports_directive: $ => seq(
      'imports',
      '=',
      $.identifier_list
    ),

    identifier_list: $ => seq(
      '[',
      optional(sep1($.identifier, ';')),
      ']'
    ),

    class_definition: $ => seq(
      'def',
      $.class_name,
      '(',
      optional($.class_parameters),
      ')',
      optional($.documentation),
      optional($.class_body),
      'end'
    ),

    class_name: $ => $.identifier,

    class_parameters: $ => sep1($.class_parameter, ';'),

    class_parameter: $ => seq(
      $.identifier,
      '=',
      $.expression
    ),

    documentation: $ => prec(2, $.string_literal),

    class_body: $ => repeat1(choice(
      $.field_definition,
      $.method_definition
    )),

    field_definition: $ => seq(
      'self',
      $.identifier,
      '=',
      $.expression,
      ';'
    ),

    method_definition: $ => seq(
      'method',
      $.method_signature,
      optional($.documentation),
      optional($.method_body),
      choice(
        'end',
        $.explicit_return
      )
    ),

    method_signature: $ => seq(
      choice(
        $.identifier,
        $.keyword_method_name
      ),
      optional($.return_type)
    ),

    keyword_method_name: $ => prec.left(seq(
      $.keyword_part,
      repeat($.keyword_part)
    )),

    keyword_part: $ => seq(
      $.identifier,
      ':',
      $.parameter_spec
    ),

    parameter_spec: $ => seq(
        $.identifier,
        '[',
        $.type_constraint,
        ']'
    ),

    type_constraint: $ => seq(
      $.identifier,
      '->',
      $.identifier
    ),

    return_type: $ => seq(
      '->',
      $.identifier
    ),

    method_body: $ => repeat1($.statement),

    explicit_return: $ => seq(
      'end',
      ':',
      $.expression,
      ';'
    ),

    statement: $ => choice(
      $.assignment,
      $.expression_statement
    ),

    assignment: $ => seq(
      $.identifier,
      '=',
      $.expression,
      ';'
    ),

    expression_statement: $ => seq(
      $.expression,
      ';'
    ),

    expression: $ => choice(
      $.smalltalk_message,
      $.array_literal,
      $.intrinsic_call,
      $.identifier,
      $.number_literal,
      $.string_literal
    ),

    smalltalk_message: $ => choice(
      $.unary_message,
      $.keyword_message
    ),

    unary_message: $ => prec.left(2, seq(
      $.expression,
      $.identifier
    )),

    keyword_message: $ => prec.left(1, seq(
      $.expression,
      repeat1($.keyword_argument)
    )),

    keyword_argument: $ => seq(
      $.identifier,
      ':',
      $.expression
    ),

    array_literal: $ => seq(
      '[',
      optional(sep1($.expression, ';')),
      ']'
    ),

    intrinsic_call: $ => seq(
      '<',
      $.identifier,
      '>',
      $.array_literal
    ),

    identifier: $ => /[a-zA-Z_][a-zA-Z0-9_]*/,

    number_literal: $ => /\d+/,

    string_literal: $ => /"([^"\\]|\\.)*"/,

    comment: $ => token(seq('#', /.*/)),

    _whitespace: $ => /\s+/
  },

  extras: $ => [
    $.comment,
    $._whitespace
  ],

  conflicts: $ => [
    [$.unary_message, $.keyword_message],
    [$.expression, $.smalltalk_message],
    [$.identifier, $.keyword_method_name],
    [$.documentation, $.expression]
  ]
});

function sep1(rule, separator) {
  return seq(rule, repeat(seq(separator, rule)));
}
