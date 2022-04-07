# <%= packageName %>

<%= description %>

- [View demo](https://cloak-<%= name %>.netlify.app)
- [Edit CodeSandbox](https://githubbox.com/<%= repoPath %>)

## Install

1. Install with `yarn add <%= packageName %>`
2. Add to `nuxt.config` with `buildModules: ['<%= packageName %>/nuxt']`

### Project Dependencies

- `.max-w*` styles (included in Cloak via `whitespace.styl`)

### Module Options

- `cloak.<%= name %>:`
  - `maxWidthClass` - The default max-width class to use for the block.

## Usage

### Components

`<cloak-<%= name %>-block />`

Renders a Block to be used within a Tower.

- props:
  - `maxWidthClass` - A `max-w-*` class to apply to the block

## Contributing

Run `yarn dev` to open a Nuxt dev build of [the demo directory](./demo).
