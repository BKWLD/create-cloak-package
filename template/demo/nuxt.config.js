// Nuxt config
export default {

	// Load this boilerplate and this package
	buildModules: [
		'@cloak-app/boilerplate/nuxt',
		'@cloak-app/demo-theme/nuxt',
		'<%= packageName %>/nuxt',
	],

	// Example settings
	cloak: {
		<%= camelName %>: {
			blockMaxWidthClass: 'max-w',
		}
	},

	// @nuxt/content can't be loaded from module
	modules: ['@nuxt/content'],
}
