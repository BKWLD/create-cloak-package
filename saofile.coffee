camelCase = require 'lodash/camelCase'
upperFirst = require 'lodash/upperFirst'
spawnAsync = require '@expo/spawn-async'
chalk = require 'chalk'
module.exports =

	# The questions asked of the user
	prompts: -> [

		{ # Get the package name
			name: 'name'
			message: 'Package name'
			default: @outFolder
			validate: (name) -> !!name
			filter: (name) -> new Promise (resolve) ->
				return resolve('') unless name
				resolve name.replace /^(@cloak\-app\/|cloak\-)/, ''
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

		# Make a camelCase version of the name
		camelName: camelCase @answers.name

		# Make a StudlyCase version of name
		studlyName: upperFirst camelCase @answers.name

		# Make the full package name
		packageName: "@cloak-app/#{@answers.name}"

		# Make the repo path
		repoPath: "BKWLD/cloak-#{@answers.name}"

		# Make component names
		blockComponentName: "cloak-#{@answers.name}-block"

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
				'_npmignore': '.npmignore'
		}
	]

	# Things that run after fiels are copied over
	completed: ->

		# Make a spawn helpers
		spawn = (cmd, args, cwd = @outDir) => spawnAsync cmd, args,
			stdio: 'inherit'
			cwd: cwd
		spawnDemo = (cmd, args) => spawn cmd, args, "#{@outDir}/demo"

		# Init git repo
		@gitInit()

		# Install yarn deps
		await @npmInstall()

		# Install demo dependencies
		await spawnDemo 'yarn'

		# Link package for use in demo
		await spawn 'yarn', ['link']
		await spawnDemo 'yarn', ['link', "@cloak-app/#{@answers.name}"]

		# Show completion steps
		logBanner 'Done! Time for next steps:'

		# Show how to run demo
		logStep 'Run example demo', "(cd '#{@outDir}' && yarn dev)"

		# Show how to create GitHub app
		logStep 'Create & push to new GitHub repo', """
(cd '#{@outDir}' && \\
  git add . && \\
	git commit am 'Initial commit via create-cloak-package' && \\
  gh repo create \\
    -d="Standard theme for @cloak-app package demos." \\
    -h="https://cloak-#{@answers.name}.netlify.app" \\
    --source="#{@outDir}" \\
    --push --public \\
    BKWLD/cloak-#{@answers.name})
"""

		# Show how to push to Netlify
		logStep 'Create Netlify demo site', "(cd #{@outDir} && netlify init)"

		# Add a trailing space
		console.log ''

# Add a banner
logBanner = (text, color = 'green') ->
	console.log ''
	console.log chalk[color]('-'.repeat(text.length))
	console.log chalk[color](text)
	console.log chalk[color]('-'.repeat(text.length))

# Log a link
logStep = (label, step) ->
	console.log ''
	console.log chalk.bold label
	if step then console.log chalk.italic step
