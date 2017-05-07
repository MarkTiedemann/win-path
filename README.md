
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

- `dir` should be a non-empty string with the [`path.sep`](https://nodejs.org/api/path.html#path_path_sep) being `\\`. The `dir` parameter is optional; the default value is [`process.cwd()`](https://nodejs.org/api/process.html#process_process_cwd).

- `target` must be one of [`['process', 'machine', 'user']`](https://msdn.microsoft.com/en-us/library/system.environmentvariabletarget(v=vs.110).aspx). If it is not, the returned Promise will reject with `INVALID_TARGET`. The `target` parameter is optional; the default value is `process`.

### `path.get([target])`

- Resolves with the machine's current PATH variable.

### `path.has([dir, target])`

- Resolves with `true` or `false` depending on whether the specified directory is in the PATH or not.

### `path.add([dir, target])`

- Adds the specified directory to the PATH variable and returns the new PATH.
- Resolves with `WARN_DIR_ALREADY_IN_PATH` if the directory is already in the PATH.
- Resolves with `ERR_SECURITY_EXCEPTION` if adding the directory to the PATH failed due to security reasons (e.g. non-elevated process).

### `path.remove([dir, target])`

- Removes the specified directory from the PATH variable and returns the new PATH.
- Resolves with `WARN_DIR_NOT_IN_PATH` if the directory is not present in the PATH.
- Resolves with `ERR_SECURITY_EXCEPTION` if removing the directory from the PATH failed due to security reasons (e.g. non-elevated process).

## Notes

- This module is based on the Powershell scripts in the `/scripts` directory. Therefore, to be able to use it in the first place, Powershell must be in the PATH (which it is by default on a new Windows machine).
- Internally, the Powershell scripts use [`[System.Environment]::GetEnvironmentVariable('path', target)`](https://msdn.microsoft.com/en-us/library/y6k3c7b0(v=vs.110).aspx).

## License

[WTFPL](http://www.wtfpl.net/) – Do What the F*ck You Want to Public License.

Made with :heart: by [@MarkTiedemann](https://twitter.com/MarkTiedemannDE).
