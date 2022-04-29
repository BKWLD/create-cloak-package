# <%= packageName %>

<%= description %>

- [View demo](https://cloak-<%= name %>.netlify.app)
- [Edit CodeSandbox](https://githubbox.com/<%= repoPath %>)

## Install

1. Install with `yarn add <%= packageName %>`
2. Add to `nuxt.config` with `buildModules: ['<%= packageName %>']`

### Module Options

Set these properties within `cloak: { <%= name %>: { ... } }` in the nuxt.config.js:

- `maxWidthClass` - The default max-width class to use for the block.

### Project Dependencies

- `.max-w*` styles (included in Cloak via `whitespace.styl`)

## Usage

### Components

`<cloak-<%= name %>-block/>`

Renders a Block to be used within a Tower.

- props:
  - `maxWidthClass` - A `max-w-*` class to apply to the block

## Contributing

Run `yarn dev` to open a Nuxt dev build of [the demo directory](./demo).
