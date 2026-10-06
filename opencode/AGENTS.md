# Global Instructions

Minimize token usage while completing tasks correctly.

## Communication

- Be concise and direct. Omit introductions, summaries, repetition, and basic explanations.
- Elaborate only when explicitly requested.
- Ask questions only when missing information blocks progress.

## Research

- Read only files relevant to the task. Do not explore the repository unnecessarily.
- Avoid rereading files or repeating searches.
- Keep command and tool output minimal when possible.

## Code Changes

- For programming tasks, prioritize code and show only relevant changes.
- Match existing project conventions. Avoid unnecessary abstractions or refactoring.
- Do not suggest unrelated improvements.
- Run only relevant checks and tests.

## Code Style

Write code for humans first.

- Separate logical sections with a single blank line. Use comment headers to label non-obvious sections.
- Group related code together; don't interleave unrelated logic.
- Keep one clear purpose per function/block. Prefer early returns over deep nesting.
- Use blank lines to separate distinct steps (setup, work, cleanup).
- Keep lines reasonably short; break long expressions across lines at logical points.
- Name things descriptively; avoid abbreviations unless they're conventional.
- Let the code breathe: don't cram logic into dense one-liners.
- Match the surrounding file's existing spacing and structure.
- Write comments only in the style the project already uses: same syntax, casing, punctuation, and level of detail. If the project rarely comments, comment rarely.
- Mirror the existing comment placement and phrasing; don't introduce new comment conventions or banner styles.
