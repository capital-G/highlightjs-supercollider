# sclang language grammar for [highlight.js](https://highlightjs.org/)

![license](https://badgen.net/badge/license/MIT/blue)

Allows highlighting of sclang source code via `highlight.js`.
This is a fork of <https://github.com/highlightjs/highlightjs-supercollider>.

*sclang* is the language of the audio synthesis platform [SuperCollider](https://github.com/supercollider).

The implementation details are lent from <https://github.com/highlightjs/highlightjs-cypher> and <https://github.com/highlightjs/highlightjs-robots-txt>.

## Usage

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

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js"></script>
<script src="https://unpkg.com/highlightjs-sclang@0.2.0/dist/sclang.min.js"></script>
<script type="text/javascript">
  hljs.highlightAll();
</script>
```

### With Node or another build system

If you're using Node / Webpack / Rollup / Browserify, etc, simply require the language module, then register it with Highlight.js.

```javascript
var hljs = require('highlight.js');
var hljsSclang = require('highlightjs-sclang');

hljs.registerLanguage("sclang", hljsSclang);
hljs.highlightAll();
```

## Development

As the build process is rather complex (see <https://github.com/highlightjs/highlight.js/blob/main/extra/3RD_PARTY_QUICK_START.md>) this repository relies on Docker and make to create deterministic builds on any platform.

### Start development in server

```shell
make dev
```

Alternative: Start a local development server via `python3 -m http.server` and access the `test/index.html` file on <http://127.0.0.1:8000/test/index.html>.
After this modify the `src/sclang.js` file and reload the browser.

After the adjustments have been made, it is necessary to build a minified version before it can be published.

### How to run tests

```shell
make test-docker
```

Tests will also run in CI.

### How to build

```shell
make build-docker
```

### Updating `highlight.js`

The following files need to be updated if `highlight.js` needs to be updated

* `Dockerfile` pulls `highlight.js` via a git branch name - update this branch name
* `package.json` is required for testing
* `test/index.html` is required for development and links `highlight.js` from unpkg

### How to publish

* Bump version in `package.json`
* Create new commit and tag this commit
* Publish package via

  ```shell
  npm publish
  ```

## License

MIT
