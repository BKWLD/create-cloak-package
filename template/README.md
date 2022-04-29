# <%= packageName %>

<%= description %>

- [View demo](https://cloak-<%= name %>.netlify.app)
- [Edit CodeSandbox](https://githubbox.com/<%= repoPath %>)

## Install

1. Install with `yarn add <%= packageName %>`
2. Add to `nuxt.config` with `buildModules: ['<%= packageName %>']`

### Module Options

Set these properties within `cloak: { <%= name %>: { ... } }` in the nuxt.config.js:

- `blockMaxWidth` - A string that should match a global CSS class that adds horizontal `padding` and a `max-width` to the block component.  Defaults to `max-w`.

### Project Dependencies

- `.max-w*` styles (included in Cloak via `whitespace.styl`)

## Usage

### Components

`<cloak-<%= name %>-block/>`

Renders a Block to be used within a Tower.

- props:
  - `maxWidth` - A string that should match a global CSS class that adds horizontal `padding` and a `max-width` to the block component.  Defaults to `max-w`.

## Contributing

Run `yarn dev` to open a Nuxt dev build of [the demo directory](./demo).
