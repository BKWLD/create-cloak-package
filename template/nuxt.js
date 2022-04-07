import { join } from 'path'
export default function() {

	// Have Nuxt transpile resources
	this.options.build.transpile.push('<%= packageName %>')

	// Allow components to be auto-imported by Nuxt
	this.nuxt.hook('components:dirs', dirs => {
		dirs.push({
			path: join(__dirname, './adapters'),
			extensions: ['js', 'coffee'],
			prefix: 'cloak-<%= name %>',
			level: 2,
		})
		dirs.push({
			path: join(__dirname, './components'),
			extensions: ['vue', 'js', 'coffee'],
			prefix: 'cloak-<%= name %>',
			level: 2,
		})
	})

	// Set default options
	this.options.cloak = {
		...this.options.cloak,
		<%= camelName %>: {
			blockMaxWidthClass: 'max-w',
			...this.options.cloak?.<%= camelName %>,
		}
	}

	// Relay package options to runtime config
	this.options.publicRuntimeConfig.cloak = {
		...this.options.publicRuntimeConfig.cloak,
		<%= camelName %>: this.options.cloak?.<%= camelName %>,
	}
}

// Required for published modules
module.exports.meta = require('./package.json')
