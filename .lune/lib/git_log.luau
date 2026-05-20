--!strict

local process = require "@lune/process"

type Result<T> =
	{
		err: string,
	}
	| {
		ok: T,
	}

local GIT = "git"

export type GitLogParsed = {
	hash: string,
	short_hash: string,
	subject: string,
}

local function get_logs_from(tag: string): Result<{ GitLogParsed }>
	local prev_tag = process.exec(GIT, { "describe", "--tags", "--abbrev=0", tag .. "~" })
	prev_tag = string.gsub(prev_tag.stdout, "%s+", "")

	local result = process.exec(GIT, { "log", prev_tag .. ".." .. tag, "--pretty=format:'%H:::%h:::%s:::;;;'" })

	if result.ok then
		if result.stdout == "" then
			return {
				ok = {},
			}
		end
		--print(result.stdout)
		local commits = string.split(result.stdout, ";;;'\n")

		local parsed: { GitLogParsed } = {}
		for _, v in commits do
			v = string.sub(v, 2)
			local split = string.split(v, ":::")
			local hash = split[1]
			local short_hash = split[2]
			local subject = split[3]

			table.insert(parsed, {
				hash = hash,
				short_hash = short_hash,
				subject = subject,
			})
		end

		return {
			ok = parsed,
		}
	else
		return {
			err = result.stderr,
		}
	end
end

return {
	get_logs_from = get_logs_from,
}
