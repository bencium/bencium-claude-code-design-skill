# UX Designer Skill

Expert UI/UX design guidance skill for Claude Code that helps create unique, accessible, and user-centered interfaces.

## Overview

This skill provides comprehensive design guidance based on your personal design philosophy, emphasizing:

- **Design Decision Collaboration**: Always asking before making design choices
- **Standing Out**: Breaking away from generic patterns and training dataset aesthetics
- **Accessibility**: WCAG 2.1 AA compliance by default
- **Modern Implementation**: Using shadcn/ui, Tailwind CSS, and modern React patterns

## Structure

```
ux-designer/
├── SKILL.md                  # Main skill file (loaded when relevant)
├── RESPONSIVE-DESIGN.md      # Detailed responsive design patterns
├── ACCESSIBILITY.md          # Comprehensive accessibility guide
└── README.md                # This file
```

## When Claude Uses This Skill

Claude automatically uses this skill when you:

- Mention design, UI, UX, styling, or visual appearance
- Ask about colors, typography, layouts, or spacing
- Request interface design or visual improvements
- Need responsive design guidance
- Ask about accessibility or WCAG compliance
- Work on forms, navigation, or interactive elements

## Key Principles

### 1. Design Decision Protocol

**ALWAYS ASK before making design decisions**

The skill enforces collaborative design decision-making:
- Colors, fonts, sizes, layouts require approval
- Present alternatives and trade-offs
- No unilateral design changes

### 2. Stand Out From Generic Patterns

Avoid typical "AI-generated" aesthetics:
- ❌ Generic SaaS blue, liquid glass, Apple mimicry
- ✅ Unique color pairs, thoughtful typography, custom visuals

### 3. Flat, Minimal Design

Current style preference:
- No shadows, gradients, or glass effects
- Clean, minimal aesthetic
- Focus on typography and color

### 4. Accessibility by Default

- WCAG 2.1 AA compliance
- Keyboard navigation
- Screen reader support
- Sufficient color contrast

## Supporting Files

### RESPONSIVE-DESIGN.md

Progressive disclosure file covering:
- Mobile-first approach
- Responsive breakpoints and patterns
- Touch-friendly interfaces
- Navigation patterns
- Form layouts
- Testing strategies

**Claude loads this when:** You ask about responsive design, mobile layouts, or cross-device compatibility.

### ACCESSIBILITY.md

Progressive disclosure file covering:
- Semantic HTML patterns
- Keyboard navigation
- ARIA attributes
- Color contrast requirements
- Screen reader compatibility
- Testing checklists

**Claude loads this when:** You ask about accessibility, WCAG compliance, or assistive technology support.

## Example Usage

### Scenario 1: Designing a Button

**You ask:**
```
I need a call-to-action button for the hero section
```

**Claude responds:**
```
Before I implement this button, I have a few design questions:
1. What's the primary action you want to emphasize?
2. Do you have brand colors in mind, or should I suggest options?
3. What emotion should this button convey? (urgent, calm, professional)

I can suggest 3 unique color directions that break from typical patterns...
```

### Scenario 2: Responsive Layout

**You ask:**
```
Make this card grid responsive for mobile
```

**Claude responds:**
```
I'll implement a mobile-first responsive grid. This will:
- Stack cards vertically on mobile (< 640px)
- Show 2 columns on tablets (640px - 1024px)
- Show 3-4 columns on desktop (> 1024px)

[Implements with Tailwind responsive classes]

I've also ensured touch targets are at least 44x44px for mobile users.
```

### Scenario 3: Accessibility

**You ask:**
```
Is this form accessible?
```

**Claude responds:**
```
Let me check this form against WCAG 2.1 AA standards:

✅ Good:
- Labels properly associated with inputs
- Logical tab order

❌ Needs improvement:
- Error messages need role="alert" for screen readers
- Submit button needs more descriptive text
- Color contrast on placeholder text is too low (2.8:1, needs 4.5:1)

Here are the specific fixes needed...
```

## Testing the Skill

After installation, test by asking design-related questions:

```
"Can you help me design a hero section?"
"How should I structure this navigation?"
"Make this interface more accessible"
"Suggest some unique color combinations"
```

Claude will automatically use the UX Designer skill based on the context of your questions.

## Version History

- **v1.0.0** (2025-10-18): Initial release
  - Comprehensive design guidance
  - Responsive design patterns
  - Accessibility reference
  - Design decision protocol

## Customization

This is a personal skill in your `~/.claude/skills/` directory. You can customize:

1. **Color Preferences**: Edit SKILL.md "Current Style Preferences" section
2. **Typography Choices**: Update recommended fonts in "Typography Excellence"
3. **Component Library**: Adjust if using different components than shadcn
4. **Accessibility Level**: Currently WCAG AA, can increase to AAA

## Related Skills

Consider pairing with these skills (if available):

- **responsive-tester**: Automated responsive layout testing
- **accessibility-audit**: Comprehensive WCAG compliance checking
- **design-system**: Brand-specific design token management

## Troubleshooting

### Claude doesn't use the skill

**Check the description in SKILL.md:**
The description should include specific triggers like "design", "UI", "UX", "styling", "visual", etc.

**Current description:**
```
Expert UI/UX design guidance for building unique, accessible, and user-centered
interfaces. Use when designing interfaces, making visual design decisions, choosing
colors/typography, implementing responsive layouts, or when user mentions design,
UI, UX, styling, or visual appearance.
```

### Claude makes design decisions without asking

**Review the Design Decision Protocol section** in SKILL.md. The CRITICAL designation should enforce asking first.

### Supporting files aren't loaded

**This is intentional (progressive disclosure)**. Claude only loads RESPONSIVE-DESIGN.md or ACCESSIBILITY.md when specifically relevant to your question.

**To explicitly load them**, ask:
- "Show me responsive design patterns"
- "What are the accessibility requirements?"

## Contributing

This is your personal skill. As you refine your design process:

1. Update SKILL.md with new patterns
2. Add examples that worked well
3. Document edge cases you encounter
4. Update version number and history

If you want to share with your team, consider:
- Moving to project `.claude/skills/` directory
- Creating a plugin for distribution
- Contributing to the skills marketplace

## License

Personal skill - use and modify as needed for your projects.
