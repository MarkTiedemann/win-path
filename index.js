'use strict'

const { exec } = require('child_process')

const commandPrefix = 'Powershell -NoProfile -ExecutionPolicy Unrestricted -File ' + __dirname + '\\scripts\\'

const getPath = () => {
    return new Promise ((resolve, reject) => {
        exec(commandPrefix + 'get.ps1', (err, result) => {
            if (err) reject(err)
            else resolve(result.trim())
        })
    })
}

const hasPath = dir => {
    return new Promise ((resolve, reject) => {
        exec(commandPrefix + `has.ps1 -dir "${dir}"`, (err, result) => {
            if (err) reject(err)
            else {
                switch (result.trim()) {
                    case 'True': resolve(true); break
                    case 'False': resolve(false); break
                }
            }
        })
    })
}

const addPath = dir => {
    return new Promise ((resolve, reject) => {
        exec(commandPrefix + `add.ps1 -dir "${dir}"`, (err, result) => {
            if (err) reject(err)
            else resolve(result.trim())
        })
    })
}

const removePath = dir => {
    return new Promise ((resolve, reject) => {
        exec(commandPrefix + `remove.ps1 -dir "${dir}"`, (err, result) => {
            if (err) reject(err)
            else resolve(result.trim())
        })
    })
}

module.exports = {
    get: getPath,
    has: hasPath,
    add: addPath,
    remove: removePath
}
