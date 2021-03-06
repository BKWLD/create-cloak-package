// Nuxt config
export default {

	// Load boilerplate and this package's module
	buildModules: [
		'@cloak-app/boilerplate',
		'@cloak-app/demo-theme',
		'../nuxt',
	],

	// Cloak settings
	cloak: {

		// Boilerplate settings
		boilerplate: {
			siteName: '<%= packageName %> demo',
		},

		// Example settings for this package
		<%= camelName %>: {
			blockMaxWidthClass: 'max-w',
		}
	},

	// Always show logs (doesn't work from within module)
	build: { quiet: false },

	// @nuxt/content can't be loaded from module
	modules: ['@nuxt/content'],
}
