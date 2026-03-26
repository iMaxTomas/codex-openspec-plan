# Sanitization Notes

## Structure

- package root = DVC integration contract
- `follow-up-initialize/` = the minimal execution follow-up

## Replacements

- absolute repo path -> `<repo-root>`

## Preserved On Purpose

- `.artifact-cache/` directory names
- `index.sqlite`
- `query-rounds.jsonl`
- `tool-calls.jsonl`
- selected raw / derived directory layout

这些内容正是这个 DVC package 的核心边界。

## Downloader Must Localize

- repo root
- the exact subset of directories worth tracking
- whether summaries remain local-only
- whether a remote DVC backend is deferred or already required
