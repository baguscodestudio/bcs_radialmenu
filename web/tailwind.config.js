/** @type {import('tailwindcss').Config} */
module.exports = {
	content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
	theme: {
		extend: {
			fontFamily: {
				NotoSans: ['Noto Sans JP', 'sans-serif'],
			},
			colors: {
				primary: 'rgba(23, 23, 23, 0.70)',
			},
		},
	},
	plugins: [],
};
