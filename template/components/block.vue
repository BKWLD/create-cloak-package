<!-- Renders a <%= name %> block -->

<template lang='pug'>

section.<%= name %>-block(:class='classes')
	| Heya world

</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
export default

	props:

		# The max-width class
		maxWidthClass:
			type: String
			default: -> @$config.cloak?.<%= name %>?.blockMaxWidthClass || ''

	computed:

		# Root classes
		classes: -> @maxWidthClass

</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus' scoped></style>
