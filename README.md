
# win-path

**Manipulate a Windows machine's PATH from Node.js.**

## Installation

```
npm install win-path
```

## Quickstart

```js

const path = require('win-path')

// get the machine's PATH variable
path.get()
    .then(console.log)
    // => C:\rainbow;C:\unicorn

const dir = 'C:\\kittens'

// check whether dir is already in PATH
path.has(dir)
    .then(console.log)
    // => false

// add dir to the PATH
path.add(dir)
    .then(console.log)
    // => C:\rainbow;C:\unicorn;C:\kittens

// remove dir from the PATH
path.remove(dir)
    .then(console.log)
    // => C:\rainbow;C:\unicorn

```

## API

### `path.get()`

- Returns the machine's current PATH variable.

### `path.has(dir)`

- Returns `true` or `false` depending on whether the specified directory is in the PATH or not.

### `path.add(dir)`

- Adds the specified directory to the PATH variable and returns the new PATH.
- Returns `WARN_DIR_ALREADY_IN_PATH` if the directory is already in the PATH.
- Returns `ERR_SECURITY_EXCEPTION` if adding the directory to the PATH failed due to security reasons (e.g. non-elevated process).

### `path.remove(dir)`

- Removes the specified directory from the PATH variable and returns the new PATH.
- Returns `WARN_DIR_NOT_IN_PATH` if the directory is not present in the PATH.
- Returns `ERR_SECURITY_EXCEPTION` if removing the directory from the PATH failed due to security reasons (e.g. non-elevated process).

## Notes

- This module is based on the Powershell scripts in the `/scripts` directory. Therefore, to be able to use it in the first place, Powershell must be in the PATH (which it is by default on a new Windows machine).

## License

[WTFPL](http://www.wtfpl.net/) – Do What the F*ck You Want to Public License.

Made with :heart: by [@MarkTiedemann](https://twitter.com/MarkTiedemannDE).
