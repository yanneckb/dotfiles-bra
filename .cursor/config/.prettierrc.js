/* eslint-disable */

module.exports = {
    // Prettier Formatting Rules
    semi: true, // Print semicolons at the ends of statements
    trailingComma: 'all', // Print trailing commas wherever possible
    singleQuote: true, // Use single quotes instead of double quotes
    arrowParens: 'always', // Include parentheses around a sole arrow function parameter
    tabWidth: 4, // Specify the number of spaces per indentation level
    bracketSpacing: true, // Print spaces between brackets in object literals
    bracketSameLine: true, // Put the `>` of a multi-line element at the end of the last line
    htmlWhitespaceSensitivity: 'css', // Specify how to handle whitespaces in HTML
    endOfLine: 'lf', // Use LF for consistency in Shopware projects
    quoteProps: 'as-needed', // Only quote object properties when required
    jsxSingleQuote: true, // Use single quotes in JSX
    printWidth: 120, // Shopware verwendet oft längere Zeilen
    overrides: [
        {
            files: ['*.twig', '*.html.twig'],
            options: {
                parser: 'angular', // Bessere Formatierung für Twig
                printWidth: 140,
                tabWidth: 4,
            },
        },
        {
            files: ['*.vue'],
            options: {
                parser: 'vue',
                printWidth: 120,
                tabWidth: 4,
            },
        },
        {
            files: ['*.scss', '*.css'],
            options: {
                printWidth: 120,
                tabWidth: 4,
            },
        },
    ],
};
