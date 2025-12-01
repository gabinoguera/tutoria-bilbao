# GitHub Copilot Instructions for BrainCode/BILBAO

You are an AI assistant working in the **BrainCode/BILBAO** educational repository. This project is a workshop designed to teach developers how to use GitHub Copilot, Prompting, and AI tools effectively.

## 🏗 Project Architecture & Context
- **Purpose**: Educational material for "Sesión 1" (Intro) and "Sesión 3" (Documentation & Reverse Engineering).
- **Structure**: Organized by sessions (`Sesion_1_Desarrollo`, `Sesion_3_Documentacion_Completa`).
- **Domain**: A simulated "Metro Bilbao" system used for exercises.
- **Tech Stack**:
  - **Documentation**: Markdown (`.md`) with Mermaid diagrams.
  - **Backend**: C# (.NET) for logic examples.
  - **Database**: SQL (Oracle/PostgreSQL compatible) and PL/SQL.

## 📝 Coding Conventions

### General
- **Educational Tone**: Code should be clear, well-commented, and suitable for teaching.
- **Comments**: Use `// EJERCICIO:` markers to indicate where students should interact.
- **Language**: The primary language for documentation and comments is **Spanish**.

### C# (.NET)
- **Namespace**: Use `Metro.Validation.Service` or similar domain-specific namespaces.
- **Documentation**: Always use XML documentation (`/// <summary>`) for public methods and classes.
- **Style**: Keep logic simple for demonstration (e.g., `TarifasService.cs`).

### SQL / PL/SQL
- **Compatibility**: Write SQL that is generally compatible with PostgreSQL and Oracle unless specified otherwise.
- **Schema**: Follow the `metro_schema.sql` conventions (snake_case for tables/columns).
- **PL/SQL**: Use standard Oracle syntax for packages and procedures (e.g., `PKG_VALIDACION.sql`).

### Markdown & Documentation
- **Formatting**: Use emojis for section headers (e.g., `## 🎯 Objetivos`, `## ⚙️ Requisitos`).
- **Diagrams**: Use **Mermaid** for ER diagrams and flowcharts.
- **Prompting**: When explaining concepts, reference techniques like "Chain of Thought" (CoT) or "Few-Shot Prompting" as taught in the course.

## 🚀 Critical Workflows
- **Diagram Generation**: When asked to analyze SQL, offer to generate a Mermaid ER diagram.
- **Reverse Engineering**: When analyzing code, summarize the logic first, then provide technical details (simulating the "Reverse Engineering" lesson).
- **Exercises**: If generating new exercises, follow the pattern: Context -> Activity -> Prompt Example.

## 🔍 Common Patterns
- **Files**:
  - `00_guion_clase.md`: Instructor scripts.
  - `casos_metro/`: Database schemas and seeds.
  - `ejemplos/`: Code snippets for specific languages.

## 🚫 Anti-Patterns
- Do not generate overly complex enterprise patterns unless requested; keep examples focused on the lesson.
- Do not remove `// EJERCICIO:` comments when refactoring unless explicitly asked to solve the exercise.
