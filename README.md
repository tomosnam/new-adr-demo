# new-adr skill — demo

A complete, working example of a Claude Code skill with supporting files.

## Structure

```
new-adr-demo/
├── .claude/skills/new-adr/
│   ├── SKILL.md              ← main instructions (short)
│   ├── madr-template.md      ← template to fill in
│   ├── example-DM-0001.md    ← finished example to imitate
│   ├── source-labels.md      ← DM-0001 labels and rules
│   └── scripts/
│       └── next-adr-id.sh    ← finds the next free ID
└── docs/adr/
    ├── DM-0001-source-confidence-model.md
    └── DM-0002-yaml-frontmatter-contract.md
```

## Try it

1. Open a terminal in this folder and start Claude Code:
   ```bash
   cd new-adr-demo
   claude
   ```
2. Type `/` and check that `new-adr` appears in the menu.
3. Run:
   ```
   /new-adr Use Kafka for events between Policy and Billing
   ```
4. Claude should:
   - run the script and get `DM-0003`
   - ask you for context, options and decision-makers
   - create `docs/adr/DM-0003-use-kafka-for-events-between-policy-and-billing.md`
   - list the `AI_INFERENCE` items you must validate

## Test the script alone

```bash
bash .claude/skills/new-adr/scripts/next-adr-id.sh docs/adr
# DM-0003
```

## Things to notice

- `disable-model-invocation: true` → only you can trigger it; Claude won't create ADRs on its own.
- `$ARGUMENTS` → replaced with the text after `/new-adr`.
- `${CLAUDE_SKILL_DIR}` → the skill folder, so the script is found from any working directory.
- `allowed-tools` → the script runs without a permission prompt, only during that turn.
- The template, example and labels load only when Claude needs them (progressive disclosure).
