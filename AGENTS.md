<!-- AI-PLC CODEX START -->
## AI-PLC for Codex

AI-PLC uses a 4-stage pipeline:

`Collection -> Inception -> Construction -> Operation`

In Codex, prefer these skills for multi-step work:

- `$ai-plc-collection`
- `$ai-plc-inception`
- `$ai-plc-construction`
- `$ai-plc-operation`

Key artifacts:

- `intent.yaml`
- `context.yaml`
- `backlog.yaml`
- `Context/`
- `Agents/`
- `Documents/`

For multi-step tasks, use the AI-PLC skill flow before ad-hoc implementation. Do not overwrite existing files unconditionally. After implementation, run validation and update `backlog.yaml` / `context.yaml` as needed.
<!-- AI-PLC CODEX END -->
