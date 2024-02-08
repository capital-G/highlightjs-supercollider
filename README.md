# supercollider - a  sclang language grammar for highlightjs

![license](https://badgen.net/badge/license/MIT/blue)

> sclang is the language of the audio synthesis platform SuperCollider

The implementation details are lent from <https://github.com/highlightjs/highlightjs-cypher> and <https://github.com/highlightjs/highlightjs-robots-txt>.

## Usage

Simply include the Highlight.js library in your webpage or Node app, then load this module.

### Static website or simple usage

Simply load the module after loading Highlight.js.
It is possible to use the minified version found in the `dist` directory.  This module is just a CDN build of the language, so it will register itself as the Javascript is loaded.

```html
<script type="text/javascript" src="/path/to/highlight.min.js"></script>
<script type="text/javascript" src="/path/to/sclang.min.js"></script>
<script type="text/javascript">
  hljs.highlightAll();
</script>
```

### Using directly from the UNPKG CDN

TODO

### With Node or another build system

If you're using Node / Webpack / Rollup / Browserify, etc, simply require the language module, then register it with Highlight.js.

```javascript
var hljs = require('highlight.js');
var hljsSclang = require('highlightjs-sclang');

hljs.registerLanguage("sclang", hljsSclang);
hljs.highlightAll();
```

## Development

`make dev`

Alternative: Start a local development server via `python3 -m http.server` and access the `test/index.html` file on <http://127.0.0.1:8000/test/index.html>.
After this modify the `src/sclang.js` file and reload the browser.

After the adjustments have been made, it is necessary to build a minified version before it can be published.

### How to build

`make build-docker`

As the build process is rather complex (see <https://github.com/highlightjs/highlight.js/blob/main/extra/3RD_PARTY_QUICK_START.md>) this repository relies on Docker and make to create deterministic builds on any platform.

### How to run tests

`make test-docker`

Tests will run in CI.

### Updating `highlight.js`

The following files need to be updated if `highlight.js` needs to be updated

* `Dockerfile` pulls `highlight.js` via a git branch name - update this branch name
* `package.json` is required for testing
* `test/index.html` is required for development and links `highlight.js` from unpkg

## License

MIT
