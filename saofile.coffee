camelCase = require 'lodash/camelCase'
upperFirst = require 'lodash/upperFirst'
module.exports =

	# The questions asked of the user
	prompts: -> [

		{ # Get the package name
			name: 'name'
			message: 'Package name (kebab-case w/o org prefix)'
			default: @outFolder
			validate: (name) -> !!name and !name.match /@/
		}

		{ # Get the package description
			name: 'description'
			message: 'Project description'
			validate: (description) -> !!description
			filter: (description) -> new Promise (resolve) ->
				return resolve('') unless description
				resolve if description.endsWith '.'
				then description
				else description + '.'
		}
	]

	# Massage input data
	templateData: ->

		# Make a StudlyCase version of name
		studlyName: upperFirst camelCase @answers.name

	# Setup the template manipulation actions
	actions: -> [

		{ # Add and transform all files
			type: 'add'
			files: '**'
		}

		{ # Fix gitignore
			type: 'move'
			patterns:
				'_gitignore': '.gitignore'
		}
	]

	# Things that run after fiels are copied over
	completed: ->
		@gitInit()
		await @npmInstall()
