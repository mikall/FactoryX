#!/bin/bash
# SDD Framework Installer
# Usage: ./install.sh "ProjectName"

set -e

PROJECT_NAME="${1:?Usage: ./install.sh \"ProjectName\"}"
DATE=$(date +%Y-%m-%d)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== SDD Framework Installer ==="
echo "Project: $PROJECT_NAME"
echo ""

# Create directory structure
echo "[1/5] Creating directory structure..."
mkdir -p .claude/agents
mkdir -p .claude/skills/sprint-planning
mkdir -p .claude/skills/requirements-analysis
mkdir -p .claude/skills/sprint-execution
mkdir -p .claude/skills/quick-fix
mkdir -p .claude/skills/project-bootstrap/steps
mkdir -p .claude/skills/help
mkdir -p intake
mkdir -p analysis/checklists
mkdir -p requirements/sprints
mkdir -p src/apps
mkdir -p deliverables/{db,api,deploy}
mkdir -p test
mkdir -p .tmp

# Copy agents
echo "[2/5] Installing agents..."
cp "$SCRIPT_DIR/.claude/agents/"*.md .claude/agents/

# Copy skills
echo "[3/5] Installing skills..."
for skill in project-bootstrap sprint-planning requirements-analysis sprint-execution quick-fix help; do
    cp "$SCRIPT_DIR/.claude/skills/$skill/SKILL.md" ".claude/skills/$skill/SKILL.md"
done

# Copy project-bootstrap step files (micro-file architecture)
if [ -d "$SCRIPT_DIR/.claude/skills/project-bootstrap/steps" ]; then
    cp "$SCRIPT_DIR/.claude/skills/project-bootstrap/steps/"*.md ".claude/skills/project-bootstrap/steps/"
fi

# Copy project-bootstrap data files (domain/project type detection)
if [ -d "$SCRIPT_DIR/.claude/skills/project-bootstrap/data" ]; then
    mkdir -p ".claude/skills/project-bootstrap/data"
    cp "$SCRIPT_DIR/.claude/skills/project-bootstrap/data/"*.csv ".claude/skills/project-bootstrap/data/"
fi

# Copy and customize CLAUDE.md
echo "[4/5] Creating project files..."
sed -e "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" \
    "$SCRIPT_DIR/.claude/CLAUDE.md" > .claude/CLAUDE.md

# Copy templates
sed -e "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" \
    -e "s/{{DATE}}/$DATE/g" \
    -e "s/{{START_DATE}}/$DATE/g" \
    "$SCRIPT_DIR/templates/project.md" > project.md

for template in principles.md functional-analysis.md technical-analysis.md HLA.md risk-register.md lessons-learned.md; do
    sed -e "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" \
        -e "s/{{DATE}}/$DATE/g" \
        "$SCRIPT_DIR/templates/$template" > "analysis/$template"
done

sed -e "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" \
    -e "s/{{DATE}}/$DATE/g" \
    "$SCRIPT_DIR/templates/requirements-list.md" > requirements/requirements-list.md

sed -e "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" \
    -e "s/{{DATE}}/$DATE/g" \
    "$SCRIPT_DIR/templates/testbook.md" > test/testbook.md

# Copy checklists
cp "$SCRIPT_DIR/templates/checklists/"*.md analysis/checklists/

# Create empty plan
echo "# $PROJECT_NAME - Sprint Plan" > requirements/plan.md
echo "" >> requirements/plan.md
echo "| Sprint | Goal | Status |" >> requirements/plan.md
echo "|--------|------|--------|" >> requirements/plan.md
echo "| S0 | Initial setup | In progress |" >> requirements/plan.md

echo "[5/5] Done!"
echo ""
echo "=== Project '$PROJECT_NAME' initialized ==="
echo ""
echo "Next steps:"
echo "  1. Drop your project materials into intake/ (docs, specs, notes, screenshots...)"
echo "  2. Run 'claude' to start Claude Code"
echo "  3. Use /help to see project status and recommended next step"
echo "  4. Use /project-bootstrap to process intake materials and define stack/architecture"
echo "  5. Use /sprint-planning to plan your first sprint"
echo ""
echo "Note: Templates contain {{PLACEHOLDER}} fields that will be populated during /project-bootstrap."
echo ""
