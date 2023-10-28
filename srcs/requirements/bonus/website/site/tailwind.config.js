/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{js,ts,jsx,tsx}'],

  theme: {
    daisyui: {
      themes: ["light", "dark"],
    },
    extend: {},
  },
  plugins: [require('daisyui')],
}