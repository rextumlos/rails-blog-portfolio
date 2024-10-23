module.exports = {
    content: [
        './app/views/**/*.html.erb',
        './app/helpers/**/*.rb',
        './app/assets/stylesheets/**/*.css',
        './app/javascript/**/*.js'
    ],
    theme: {
        extend: {
            fontFamily: {
                sans: ['Inter', 'Helvetica', 'Arial', 'sans-serif'],  // Add custom font for sans
                header: ['Arimo', 'sans-serif'],                 // Example of a custom local font
            },
            fontSize: {
                'xs': '0.75rem',      // Extra Small
                'sm': '0.875rem',     // Small
                'base': '1rem',       // Base
                'lg': '1.125rem',     // Large
                'xl': '1.25rem',      // Extra Large
                '2xl': '1.5rem',      // 2X Large
                '3xl': '1.875rem',    // 3X Large
                '4xl': '2.25rem',     // 4X Large
                '5xl': '3rem',        // 5X Large
                '6xl': '4rem',        // 6X Large
            },
            colors: {
                primary: {
                    light: '#10b981',
                    DEFAULT: '#00742e',
                    dark: '#022c1b',
                }
            },
        },
    },
}
