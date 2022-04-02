// Use Cloak to make boilerplate
import { mergeConfig, makeBoilerplate } from '@bkwld/cloak'
const boilerplate = makeBoilerplate({
	siteName: '<%= packageName %> demo',
	cms: '@nuxt/content',
})

// Nuxt config
export default mergeConfig(boilerplate, {

	// Load this package
	buildModules: ['<%= packageName %>/nuxt'],

	// Example settings
	cloak: {
		<%= camelName %>: {
			blockMaxWidthClass: 'max-w',
		}
	},

	// Load CMS module
	modules: ['@nuxt/content'],

	// @nuxt/content config
	content: {
		liveEdit: false
	},

	// Enable dev tools in prod
	vue: {
		config: {
			productionTip: false,
			devtools: true
		}
	},
})
