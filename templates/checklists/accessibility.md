# Accessibility Checklist

> Must pass every sprint. Reference: WCAG 2.1 AA.

## Perceivable
- [ ] Alt text on all informative images
- [ ] Sufficient color contrast (4.5:1 text, 3:1 UI)
- [ ] Information not conveyed by color alone
- [ ] Content resizable to 200% without loss
- [ ] Captions/transcripts for audio/video content (if present)

## Operable
- [ ] Full keyboard navigation (Tab, Enter, Esc)
- [ ] Visible focus on all interactive elements
- [ ] No focus traps (keyboard trap)
- [ ] Skip link for main navigation
- [ ] Minimum touch/click target 44x44px

## Understandable
- [ ] Consistent and clear interface language
- [ ] Labels associated with all form fields
- [ ] Descriptive error messages associated with the field
- [ ] Instructions for complex forms
- [ ] Predictable behavior (no context change on focus/input)

## Robust
- [ ] Semantic HTML (hierarchical headings, landmarks, lists)
- [ ] ARIA attributes only where semantic HTML isn't enough
- [ ] Correct ARIA roles and states on custom components
- [ ] Screen reader compatibility (VoiceOver/NVDA)

## UI Library Components
- [ ] UI library components used with accessible default props
- [ ] Dialog: focus trap active, Esc closes
- [ ] Select/Combobox: keyboard navigable
- [ ] Toast/Alert: role="alert" for important notifications
