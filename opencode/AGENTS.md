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
- Verify that applicable project and global instructions were followed.
