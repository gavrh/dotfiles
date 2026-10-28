# Global Instructions

These rules apply to every task unless the user explicitly overrides them.

## Communication

- Be concise and direct.
- Do not include introductions, summaries, repetition, or basic explanations unless requested.
- Ask questions only when missing information prevents correct progress.

## Repository Work

- Read only files necessary for the current task.
- Do not explore unrelated parts of the repository.
- Do not reread files or repeat searches without a concrete reason.
- Keep command and tool output minimal.

## Git and External Actions

Never perform any of the following without the user explicitly requesting that exact action in the current conversation:

- Creating, amending, rebasing, merging, or cherry-picking commits.
- Pushing or force-pushing to any remote.
- Creating or changing tags or remote branches.
- Creating, updating, closing, approving, or commenting on issues, pull requests, discussions, reviews, forums, social media, pastebins, or any other public service.
- Uploading logs, screenshots, configuration, or other data to an external service.

A request to inspect, diagnose, fix, plan, or edit is not permission to commit, push, merge, or post anything.

Read-only operations are allowed, including `git status`, `git diff`, `git log`, `gh pr view`, web searches, and fetching documentation.

Before any prohibited action, state exactly what will be done and wait for explicit confirmation. These rules also apply to subagents and background tasks.

## Code Changes

- Make only changes required by the task.
- Do not perform unrelated refactors, cleanup, renaming, or architectural changes.
- Match existing project conventions before introducing new patterns.
- Prefer the smallest correct change.
- Run only checks and tests relevant to the modified code.
- Do not suggest unrelated improvements unless asked.

## Code Style

Write code for humans first.

- Match the surrounding file's existing formatting and structure.
- Group related logic together.
- Keep one clear purpose per function or block.
- Prefer early returns over deep nesting.
- Avoid dense one-liners when they reduce readability.
- Break long expressions at logical boundaries.
- Use descriptive names; avoid nonstandard abbreviations.
- Do not introduce new comment styles.
- Match the project's existing comment syntax, casing, punctuation, placement, and level of detail.
- If the project rarely uses comments, comment rarely.

## Final Check

Before finishing:
- Verify that every change is necessary for the requested task.
- Verify that no unrelated files or behavior were modified.
- Verify that no commits, pushes, or external posts were made without explicit permission.
- Verify that applicable project and global instructions were followed.
