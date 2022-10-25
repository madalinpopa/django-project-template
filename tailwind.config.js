/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ['./{{ project_name }}/**/*.{html,js}'],
    theme: {
        extend: {
            container: {
                center: true,
            },
        },
    },
    plugins: [],
}
