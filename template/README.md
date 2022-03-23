# @cloak-app/<%= name %>

<%= description %>  [View demo](https://cloak-<%= name %>.netlify.app/).

```vue
<cloak-<%= name % />
```

## Install

1. Install with `yarn add @cloak-app/<%= name %>`
2. Add to `nuxt.config` with `buildModules: ['@cloak-app/<%= name %>/nuxt']`

### Project Dependencies

- `.max-w*` styles (included in Cloak via `whitespace.styl`)

### Module Options

- `cloak.<%= name %>:`
  - `maxWidthClass` - The default max-width class to use for the block.

## Components

### `cloak-<%= name %>-block`

Renders a Block to be used within a Tower.

- props:
  - `maxWidthClass` - A `max-w-*` class to apply to the block
