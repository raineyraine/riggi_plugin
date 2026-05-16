--!strict

local stdio = require "@lune/stdio"
local color = stdio.color
local style = stdio.style
local stderr = stdio.ewrite
local stdout = stdio.write

type Map<Key, Value> = { [Key]: Value }

local log = {}
log.stdout = stdout
log.stderr = stderr

export type LogKind = "error" | "blank" | "warn"
local LOG_KINDS: Map<LogKind, stdio.Color> = {
	error = "red",
	warn = "yellow",
}
local function alert(kind: LogKind, message: string, noBold: boolean?, noColor: boolean?)
	local bold_render = if noBold then "" else style("bold")
	local color_render = if noColor then "" else color(LOG_KINDS[kind] or "white")

	local render = `{color_render .. bold_render}{kind}:{style("reset")} {message}{style("reset")}\n`

	if kind == "error" or kind == "warn" then
		stderr(render)
	else
		stdout(render)
	end
end
log.alert = alert

local function out_line(message: string)
	stdout(message .. "\n")
end
log.out_line = out_line

local function err_line(message: string)
	stderr(message .. "\n")
end
log.err_line = err_line

return log
