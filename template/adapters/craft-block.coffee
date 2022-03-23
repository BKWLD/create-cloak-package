###
Render the <%= name %> block from Craft block data
###
export default
	functional: true
	props: block: Object
	render: (create, { props: { block }, data }) ->
		create 'cloak-<%= name %>-block', {
			...data
			props: block
		}
