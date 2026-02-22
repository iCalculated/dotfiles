# Digitize Pocket Notebook

Process photos of handwritten notebook pages and create notes in the vault.

## Source

If `$ARGUMENTS` is a file path, read the image directly from that path.

Otherwise, check iMessage for recent photos sent to self (conversation 424). Look at the most recent messages with image attachments. Use `get_messages` on conversation 424 with a small limit, then `get_attachment` on any image attachments found.

If multiple images are found, process all of them. Ask which ones to use if there are more than 3.

## Reading the notebook

Pocket notebook handwriting is messy. Do your best to OCR it. Common content types:
- **Todo items** — short action items, reminders
- **Book/media references** — author names, titles
- **Technical notes** — code snippets, architecture ideas
- **Random thoughts** — one-liners, observations
- **Diagrams/sketches** — reproduce in excalidraw

When unsure about a word, give your best guess. It's better to get something slightly wrong than to skip it — the user will correct during review.

### Lambda (λ) = todo

The user writes a λ symbol next to items that are todos. When you see a lambda-marked item, escalate it to `04 essence/TODO.md` in addition to including it in the notebook note.

TODO.md is a kanban board with lanes as `##` headings: future, urgent, ongoing, done, blocked, social, fun, Archive.

**Rules for TODO.md:**
- Items are ALWAYS `- [ ]` (unchecked) — the lane IS the status. Never use `[x]`.
- New λ items go to `## urgent` by default.
- **Before adding, search existing items** — avoid duplicates! The item may already exist with more context. If it exists in `## future`, move it to `## urgent`.
- Crossed-out items on the whiteboard = done. Move them to the `## done` lane.

### Crossed-out items

Items that are crossed out / struck through on the whiteboard or notebook mean "done." In the note, render them as `~~item~~`. In TODO.md, move them to the `## done` lane.

## Output

### File naming

`02 sparks/YYYY-MM-DD HHMM {type} {title}.md`

Pick the type suffix based on the source:
- **scrawl** — pocket notebook (small, spiral-bound, terse jottings)
- **note** — full-size notebook (dot grid, more structured)
- **whiteboard** — whiteboard photo (may need multiple photos, heavy on diagrams)

Pick a short descriptive title from the page content (e.g., `geometry oracle`, `packing list`).

### Content note format

```
[[YYYY-MM-DD]]

page dated X.XX — {title}

- text item one
- text item two

![[YYYY-MM-DD HHMM {type} {title}.excalidraw]]

![[YYYY-MM-DD HHMM {title} full.jpeg]]
```

Rules:
- `[[YYYY-MM-DD]]` wikilink at top — creates backlink in graph view
- Bullet list for text content only — do NOT describe diagrams textually
- Excalidraw embeds for any diagrams/sketches
- Original photo embedded at the bottom
- Lowercase, casual tone — match the vault style
- If items are clearly grouped, use sub-headers

### Diagrams → Excalidraw

For any diagram or sketch on the page, create an excalidraw file:

`02 sparks/YYYY-MM-DD HHMM {type} {title}.excalidraw.md`

- Frontmatter: `excalidraw-plugin: parsed`, `tags: [excalidraw]`
- `[[YYYY-MM-DD]]` backlink at top
- Use `roughness: 1` for hand-drawn look
- Red labels (`#e03131`), black lines (`#1e1e1e`)
- Hachure fill with `#a5d8ff` for shaded regions
- Embed in the content note via `![[...excalidraw]]`

### Original photo

1. Fetch HEIC from iMessage attachments
2. Convert: `sips -s format jpeg input.HEIC --out /tmp/output.jpeg`
3. Copy to `00 nova/images/YYYY-MM-DD HHMM {title} {variant}.jpeg`
4. Variant: "full", "closeup", "1", "2", etc.
5. Embed in content note via `![[filename.jpeg]]`

### Multiple photos (whiteboard)

When multiple photos cover the same whiteboard/page:
- Store all photos with numbered variants
- Use all photos as reference when building the excalidraw
- Embed the best overview photo in the content note

## After creation

Show the user what was created so they can review and correct. Mention anything you were uncertain about in the OCR. Call out which items were escalated to TODO.md.
