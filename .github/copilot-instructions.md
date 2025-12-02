# GitHub Copilot Instructions - Metro Bilbao Training Repository

## Project Purpose
This is a **training repository** for teaching GitHub Copilot and AI-assisted development to Metro Bilbao developers. It contains workshop materials, exercises, and sample code demonstrating "vibecoding" techniques - using AI to understand, generate, and document code.

**Target Audience**: Developers with basic technical skills learning to work with AI coding assistants. Exercises progress from simple code generation to complex database analysis and documentation.

## Repository Structure

### Core Workshop Sessions
- **`Sesion_1_Desarrollo/`**: Intro session - Basic Copilot usage, simple prompts, JavaScript/SQL generation exercises
  - Focus: Getting started, writing first prompts, validating AI-generated code
  - Key files: `02_ejercicio_generacion_codigo.md`, `03_ejercicio_sql_simple.md`
  
- **`Sesion_3_Documentacion_Completa/`**: Advanced session - Reverse engineering, documentation generation, prompting techniques
  - Focus: Understanding existing code, generating diagrams, XML comments, README/CHANGELOG
  - Key files: `01_conceptos_prompting.md`, `02_ejercicio_analisis_db.md`
  - Subdirectories:
    - `casos_metro/`: SQL schemas for metro system (`metro_schema.sql`, `seed_data.sql`)
    - `ejemplos/`: Sample C# and Oracle PL/SQL code for documentation exercises
    - `Anexos/`: Reference materials (ERD diagrams, metro maps)

### Data Files
- **`estaciones.csv`**: Real metro station data (stops, GPS coordinates, zones) used in visualization and analysis exercises

## Domain Context: Metro Bilbao System

The codebase simulates a **metro fare validation system** with these components:

### Database Schema (PostgreSQL/Oracle compatible)
Key tables in `Sesion_3_Documentacion_Completa/casos_metro/metro_schema.sql`:
- `lineas`: Metro lines (L1, L2) with color codes
- `estaciones`: Stations with zone info (1-3) and GPS coordinates
- `usuarios`: Users with types (regular, estudiante, tercera_edad, empresa)
- `billetes`: Tickets/passes with types (sencillo, bono_10, mensual, etc.)
- `validaciones`: Entry/exit transactions with fare calculations
- `recargas`: Top-up transactions

### Business Rules
- **Zone-based fares**: Travel cost depends on zones traversed (1-3 zones)
- **User discounts**: 
  - JOVEN (youth): 50% discount
  - JUBILADO (senior): 75% discount
- **Peak hours**: 7-9am and 6-8pm (referenced in `TarifasService.cs`)
- Children under 6 travel free (not validated at turnstiles)

### Code Examples
- **C#** (`ejemplos/csharp/TarifasService.cs`): Fare calculation service with zone logic and discount rules
- **Oracle PL/SQL** (`ejemplos/oracle/PKG_VALIDACION.sql`): Balance validation and turnstile logging package

## Teaching Philosophy & Prompting Patterns

### "Vibecoding" Approach
Code generation through natural language intent. Exercises emphasize:
1. **Clarity over cleverness**: Simple, explicit prompts work best
2. **Validation required**: Always test AI-generated code
3. **Iterative refinement**: Start simple, add complexity incrementally
4. **Context is critical**: Provide domain knowledge in prompts

### Advanced Prompting Techniques (Session 3)
Documented in `Sesion_3_Documentacion_Completa/01_conceptos_prompting.md`:

- **Chain of Thought (CoT)**: "Analyze step-by-step..." for complex procedures
- **Few-Shot Prompting**: Show examples to maintain documentation style consistency
- **Role Prompting**: "Act as a Database Architect..." for perspective-specific analysis
- **APE (Automatic Prompt Engineering)**: Let AI refine prompts for better results
- **Knowledge-Based Reasoning**: Include business rules (e.g., "children under 6 free") in prompts

### Example Prompt Patterns (from exercises)

**Diagram generation:**
```
"Generate a Mermaid ERD diagram from metro_schema.sql showing tables 
BILLETES, VALIDACIONES, ESTACIONES with PKs and FKs"
```

**Documentation consistency (Few-Shot):**
```
"Here's how I document tables: [example format]. 
Now document the VALIDACIONES table following this pattern."
```

**Reverse engineering (CoT):**
```
"Analyze PKG_VALIDACION.sql step by step:
1. Identify input/output parameters
2. Explain conditional logic
3. Summarize in one paragraph
4. Generate a Mermaid flowchart"
```

## Conventions & Standards

### File Organization
- Workshop guides use numbered prefixes: `00_guion_clase.md`, `01_conceptos_prompting.md`, etc.
- Exercise files clearly marked: `02_ejercicio_*.md`
- Instructor notes separated from student materials (look for `00_guion_clase.md`)

### Documentation Style
- **Markdown primary format**: All exercises and guides in `.md`
- **Mermaid diagrams**: Used extensively for ERDs, flowcharts, sequence diagrams
- **XML comments for C#**: Required format with `<summary>`, `<param>`, `<returns>`, `<example>` tags
- **PL/SQL comments**: Javadoc/PLDoc style for Oracle packages

### SQL Patterns
- Schema supports both PostgreSQL (`SERIAL`) and Oracle (`NUMBER`) with minor adjustments
- Consistent naming: `snake_case` for columns, `UPPER_CASE` for table names in Oracle examples
- Indexes on common query patterns: `fecha_validacion`, `billete_id`, `zona`

### Language Conventions
- **Spanish domain terminology**: Use "Título de transporte" (not "ticket"), "Validación" (not "check-in")
- **English for code**: Variables, functions, and comments in code use English
- **Spanish for documentation**: User-facing docs and workshop materials in Spanish

## Key Workflows

### For Workshop Instructors
1. **Pre-session setup** (5 min before): Check `00_guion_clase.md` for timing and priorities
2. **Pacing guidance**: Exercises marked with priorities (✅ IMPRESCINDIBLE, ⚠️ Optional)
3. **Troubleshooting**: Common issues documented in README.md (Copilot activation, VS Code restart)

### For Students/Participants
- **No complex setup required**: Exercises designed for VS Code + Copilot only
- **No database needed**: SQL exercises are read/explain, not execute
- **Progressive difficulty**: Session 1 is basic (calculators, simple prompts), Session 3 is advanced (architecture analysis)

### Common Commands (When Applicable)
- No build commands - repository is documentation/exercises only
- For future C# examples: Standard .NET 8 patterns (`dotnet build`, `dotnet test`)
- For Oracle: Docker container recommended (referenced in session guides)

## AI Agent Guidance

### When Generating New Exercises
- Match existing numbering scheme (`0X_ejercicio_*.md`)
- Include: **Objetivo**, **Contexto**, **Pasos** (numbered), **Prompt Sugerido** sections
- Provide example prompts in blockquotes with `>` prefix
- Reference actual files from `casos_metro/` or `ejemplos/` directories

### When Creating Documentation Examples
- Use Metro Bilbao domain (stations, fares, zones) for realistic context
- Follow Few-Shot pattern: show format example, then generate new content
- Include Mermaid diagrams when explaining architecture/flows
- Add business rule comments: "// REGLA NEGOCIO: menores 6 años gratis"

### When Analyzing Code
- Apply Chain of Thought: break down complex logic step-by-step
- Reference zone-based fare rules when discussing `TarifasService.cs`
- For PL/SQL packages, explain Oracle-specific patterns (sequences, exception handling)
- Generate both technical and functional descriptions (for developers AND business users)

### What NOT to Do
- Don't create actual databases or connection strings (exercises are conceptual)
- Don't assume advanced technical knowledge (target is basic developers)
- Don't skip validation steps (core teaching principle: always test AI output)
- Don't use generic examples unrelated to Metro Bilbao domain

## Critical Context for AI

**This is a teaching repository, not production code.** When asked to:
- Generate code: Prioritize **clarity and educational value** over optimization
- Fix errors: **Explain the fix** in addition to providing corrected code
- Add features: Show **progressive refinement** - simple version first, then enhance
- Review code: Point out **learning opportunities** and suggest prompts students could use

The goal is to teach effective AI collaboration, not just produce working code.
