# Sanitization Notes

## Replacements

- local future platform name -> `<future-control-plane>`
- local repository root assumptions -> generic repository wording

## Preserved On Purpose

- `.artifact-cache/`
- `index.sqlite`
- `query-rounds.jsonl`
- `tool-calls.jsonl`

这些字段是设计语义的一部分，不是现场隐私。

## Downloader Must Localize

- helper script paths
- actual cache root location if not using repo root
- any future control-plane name you want to use in your own stack
