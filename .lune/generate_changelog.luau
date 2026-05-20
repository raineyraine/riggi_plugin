--!strict

local fs = require "@lune/fs"
local process = require "@lune/process"
local stdio = require "@lune/stdio"

local git_log = require "./lib/git_log"

local function fail(msg: string)
	stdio.ewrite(`{stdio.color("red")}{msg}{stdio.color("reset")}\n`)
	return process.exit(1)
end

local logs: any = git_log.get_logs_from(process.args[1] or fail("failed to get logs: no tag provided"))
if logs.err then
	fail("failed to get logs:\n" .. logs.err)
end

local CHANGELOG_PATH = "CHANGELOG.md"

local changelog_text = "| Commit | Message |\n"
changelog_text ..= "| -- | -- |\n"

local COMMIT_LINK = "https://github.com/raineyraine/roblox-plugin-riggi/commit/"

for _, commit: git_log.GitLogParsed in logs.ok do
	local line = `| [\`{commit.short_hash}\`]({COMMIT_LINK .. commit.hash}) | {commit.subject} |`

	changelog_text ..= line .. "\n"
end

if #logs.ok == 0 then
	changelog_text = "No commits"
end

stdio.write(changelog_text)

local CHANGELOG_CURRENT = fs.readFile(CHANGELOG_PATH)
fs.writeFile(CHANGELOG_PATH, `# {process.args[1]}\n{changelog_text}\n` .. CHANGELOG_CURRENT)
