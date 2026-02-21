# Collapser Fieldtype

A collapsible container fieldtype for Statamic. Groups related fields into expandable/collapsible sections — like the built-in Group fieldtype, but collapsed by default.

## Features

- Collapsed by default, toggled open/closed by clicking the header
- Red border indicator when nested fields have validation errors
- Dark mode support
- Keyboard accessible (Enter/Space to toggle)

## Requirements

- Statamic 6+

## Installation

```bash
composer require netforma/collapser-fieldtype
```

## Usage

Add a **Collapser** field to your blueprint and configure the nested fields inside it. In the publish form, the section appears collapsed — click the header to expand and edit the fields within.

## Development

Requires Docker. The addon builds independently using containerized Composer and Node:

```bash
# Install dependencies + build assets
make build

# Start Vite dev server with HMR
make dev

# Install dependencies only
make install
```

Dependencies are cached — `make build` skips install if `composer.json` and `package.json` haven't changed.
