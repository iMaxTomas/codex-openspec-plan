# Sanitization Notes

## Replacements

- local future platform name -> `<future-control-plane>`

## Preserved On Purpose

- `Langfuse`
- `Codex`
- `Claude`
- `Gemini`
- trace / artifact / memory boundary wording

这些名称直接决定设计语义，公开版保留。

## Downloader Must Localize

- actual event sources
- wrapper or adapter entrypoints
- your own control-plane or gateway naming
- any deployment-specific redaction policy
