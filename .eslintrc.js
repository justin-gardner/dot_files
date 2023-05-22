/* eslint-disable */

module.exports = {
  root: true,
  env: {
    node: true,
  },
  extends: [
    '@vue/airbnb',
    'plugin:vue/recommended',
  ],
  plugins: [
    'import',
  ],
  parserOptions: {
    ecmaVersion: 2020,
  },
  settings: {
    'import/resolver': {
      'alias': {
        'map': [
          ['@', '.src'],
        ],
        'extensions': [
          '.vue',
          '.json',
          '.js',
        ],
      },
    },
  },
  rules: {
    'array-bracket-newline': [
      'error', {
        'multiline': true,
        'minItems': 2,
      },
    ],
    'arrow-parens': ['error', 'as-needed'],
    'newline-after-var': ['error', 'always'],
    'newline-before-return': 'error',
    'newline-per-chained-call': [
      'error', {
        'ignoreChainWithDepth': 1,
      },
    ],
    'object-curly-newline': [
      'error', {
        'ObjectExpression': {
          'multiline': true,
          'minProperties': 1,
        },
        'ObjectPattern': {
          'multiline': true,
          'minProperties': 1,
        },
        'ImportDeclaration': 'never',
        'ExportDeclaration': {
          'multiline': true,
          'minProperties': 1,
        },
      },
    ],
    'object-property-newline': [
      'error', {
        'allowAllPropertiesOnSameLine': false,
      },
    ],
    'operator-linebreak': [
      'error',
      'after', {
        'overrides': {
          '?': 'before',
          ':': 'before',
        },
      },
    ],
    'padding-line-between-statements': [
      'error', {
        'blankLine': 'always',
        'prev': 'block-like',
        'next': '*',
      },
    ],
    'semi': ['error', 'never'],
    'space-before-function-paren': ['error', 'always'],
    'vue/attributes-order': [
      'error', {
        'order': [
          'DEFINITION',
          'LIST_RENDERING',
          'CONDITIONALS',
          'RENDER_MODIFIERS',
          'GLOBAL',
          ['UNIQUE', 'SLOT'],
          'TWO_WAY_BINDING',
          'OTHER_DIRECTIVES',
          'OTHER_ATTR',
          'EVENTS',
          'CONTENT'
        ],
        'alphabetical': false
      },
    ],
    'vue/html-indent': [
      'error',
      2, {
        'attribute': 1,
        'baseIndent': 1,
        'closeBracket': 0,
        'alignAttributesVertically': true,
        'ignores': [],
      },
    ],
    'vue/html-quotes': ['error', 'single'],
    'vue/html-self-closing': [
      'error', {
        'html': {
          'void': 'always',
          'normal': 'always',
          'component': 'always',
        },
        'svg': 'always',
        'math': 'always',
      },
    ],
    'vue/order-in-components': ['error'],
    'vue/singleline-html-element-content-newline': [
      'error', {
        'ignoreWhenNoAttributes': false,
        'ignoreWhenEmpty': true,
        'ignores': [],
      },
    ],
    'vue/multiline-html-element-content-newline': [
      'error', {
        'allowEmptyLines': false,
        'ignoreWhenEmpty': true,
        'ignores': [],
      },
    ],
    'vue/v-slot-style': [
      'error', {
        'atComponent': 'v-slot',
        'default': 'shorthand',
        'named': 'shorthand',
      },
    ],
  },
  overrides: [
    {
      files: [
        '**/__tests__/*.{j,t}s?(x)',
        '**/tests/unit/**/*.spec.{j,t}s?(x)',
      ],
      env: {
        jest: true,
      },
    },
  ],
}
