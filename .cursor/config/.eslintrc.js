/* eslint-disable */

module.exports = {
    root: true,
    parser: '@typescript-eslint/parser',
    parserOptions: {
        ecmaVersion: 2020,
        sourceType: 'module',
        project: './tsconfig.json',
        tsconfigRootDir: __dirname,
    },
    env: {
        browser: true,
        node: true,
        es6: true,
    },
    plugins: [
        'prettier',
        'inclusive-language',
        'promise',
        '@typescript-eslint',
        'node',
        'import',
        'vue',
    ],
    extends: [
        'eslint:recommended',
        'plugin:@typescript-eslint/recommended',
        'plugin:vue/vue3-recommended',
        'plugin:prettier/recommended',
    ],
    overrides: [
        {
            files: [
                'src/Resources/app/**/*.js',
                'src/Resources/app/**/*.ts',
                'src/Resources/app/**/*.vue',
                'src/Resources/views/**/*.twig',
            ],
            rules: {
                'no-console': 'warn',
                'no-debugger': 'warn',
                'inclusive-language/use-inclusive-words': 'warn',
                'node/no-unsupported-features/es-syntax': [
                    'warn',
                    { ignores: ['modules'] },
                ],
                'import/no-unresolved': [2, { ignore: [''] }],
                'node/no-missing-import': 'warn',
                'class-methods-use-this': 'off',
                'import/extensions': [
                    'error',
                    'ignorePackages',
                    { '': 'never', js: 'never' },
                ],
                'no-param-reassign': [2, { props: false }],
                'no-use-before-define': [
                    'error',
                    {
                        functions: false,
                        classes: true,
                        variables: true,
                        allowNamedExports: false,
                    },
                ],
                'vue/html-indent': ['error', 4],
                'vue/max-attributes-per-line': ['error', { singleline: 3 }],
                'vue/singleline-html-element-content-newline': 'off',
                'vue/multiline-html-element-content-newline': 'off',
                'vue/html-self-closing': [
                    'error',
                    {
                        html: {
                            void: 'always',
                            normal: 'never',
                            component: 'always',
                        },
                    },
                ],
            },
        },
        {
            files: ['src/Resources/**/*.ts'],
            rules: {
                '@typescript-eslint/consistent-type-exports': 'error',
                '@typescript-eslint/consistent-type-imports': 'error',
            },
        },
    ],
};
