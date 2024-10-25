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
                    light: {
                        DEFAULT: 'rgba(16, 185, 129, 1)',  // 100% opacity
                        30: 'rgba(16, 185, 129, 0.3)',     // 30% opacity
                        50: 'rgba(16, 185, 129, 0.5)',     // 50% opacity
                        70: 'rgba(16, 185, 129, 0.7)',     // 70% opacity
                    },
                    DEFAULT: {
                        DEFAULT: 'rgba(0, 116, 46, 1)',    // 100% opacity
                        30: 'rgba(0, 116, 46, 0.3)',       // 30% opacity
                        50: 'rgba(0, 116, 46, 0.5)',       // 50% opacity
                        70: 'rgba(0, 116, 46, 0.7)',       // 70% opacity
                    },
                    dark: {
                        DEFAULT: 'rgba(2, 44, 27, 1)',     // 100% opacity
                        30: 'rgba(2, 44, 27, 0.3)',        // 30% opacity
                        50: 'rgba(2, 44, 27, 0.5)',        // 50% opacity
                        70: 'rgba(2, 44, 27, 0.7)',        // 70% opacity
                    },
                },
            },
        },
    },
}
