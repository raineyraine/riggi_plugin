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
	body: string,
}

local function get_logs_from(tag: string): Result<{ GitLogParsed }>
	local result = process.exec(GIT, { "log", `{tag}..HEAD`, "--pretty=format:%H:::%h:::%s:::%b;;;" })

	if result.ok then
		local commits = string.split(result.stdout, ";;;\n")

		local parsed: { GitLogParsed } = {}

		for _, v in commits do
			local split = string.split(v, ":::")
			local hash = split[1]
			local short_hash = split[2]
			local subject = split[3]
			local body = split[4]

			-- trailing whitespace remove
			if string.sub(body, -1) == "\n" then
				body = string.sub(body, 1, -2)
			end

			table.insert(parsed, {
				hash = hash,
				short_hash = short_hash,
				subject = subject,
				body = body,
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
