import { Plugin } from "@opencode-ai/plugin"

export const CommandGuard: Plugin = async () => {
  return {
    "tool.execute.before": async (input, output) => {
      if (input.tool === 'bash' && output.args.command.includes("git push")) {
        throw new Error("You are not allowed to run 'git push' commands.")
      }
    },
  }
}


