# Make Anki Cards

Create high-quality Anki flashcards from the current context following Michael Nielsen's principles.

## Instructions

Read the source material carefully, then generate flashcards following these rules:

### Atomicity (Most Important)
- Each card tests ONE atomic piece of knowledge
- If an answer has multiple parts, split into multiple cards
- Bad: "What are the three components of X?" → Good: Three separate cards, one per component

### Card Types to Use
1. **Basic**: Question → Answer (most common)
2. **Cloze**: "The {{c1::Fisher matrix}} measures curvature in {{c2::KL divergence}} space"
3. **Reversal pairs**: "What does RLCT stand for?" + "What is Real Log Canonical Threshold abbreviated as?"

### Style Guide (match existing cards)
- **Lowercase** questions, no caps at start
- **Terse answers** - a phrase, not a sentence
- **LaTeX** with `\(...\)` for math
- **Code** in backticks
- **Parenthetical asides** for extra context - "(seems dubious)", "(for historical reasons)"
- **Specific numbers** when relevant
- **No tags**

### What to Avoid
- Yes/no questions (rephrase to require explanation)
- Questions with fuzzy or list-like answers
- Verbose answers - keep it punchy
- Trivia disconnected from deeper understanding

### Format Output As

Default deck is `deck` with subdecks by topic (e.g., `deck::ml`, `deck::math`, `deck::stats`).

```
DECK: deck::[subdeck]

---
Q: what is the reparametrization trick?
A: factoring a parametrized random variable into random + parameter components so gradients can flow

---
Q: what is bfloat16?
A: IEEE 754 float with truncated mantissa for easy casting
```

For cloze deletions:
```
CLOZE: the \({{c1::Fisher matrix}}\) measures curvature in \({{c2::KL divergence}}\) space
```

## Now generate cards from: $ARGUMENTS

If no arguments provided, ask the user what they want to make cards about.

**Important**: Only generate cards for concepts the user has demonstrated deep understanding of. If the user hasn't worked through the material thoroughly, suggest they do that first. Cards should crystallize understanding, not substitute for it.
