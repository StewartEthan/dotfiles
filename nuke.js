const { exec, spawn } = require('child_process')

const options = process.argv.slice(2)
const command = `rm -rf ./node_modules;`
if (!options.includes(`--keep-package-lock`)) command += `rm ./package-lock.json`

console.log(`About to run command ${command}`)
exec(command)

if (!options.includes(`--skip-install`)) {
  const childProcess = spawn(`npm`, [`install`])
  childProcess.stdout.on(`data`, data => console.log(data.toString()))
  childProcess.stderr.on(`data`, data => console.error(data.toString()))
  childProcess.on(`exit`, code => console.log(`Nuke script finished with exit code ${code}`))
}
