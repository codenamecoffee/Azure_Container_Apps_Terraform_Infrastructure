# Infra Lab — Terraform + Azure Container Apps (ACA)

Este repositorio es el **repo de infraestructura** del taller. Cada equipo debe **desplegar su app** aquí usando **Terraform** y **Azure Container Apps**.

---

## Qué ya está creado (compartido)

- **Azure Container Apps Environment** (consumption, público) — usarlo para todas las apps.

---

## Flujo de trabajo (obligatorio)

1. Crear rama: `feature/<equipo>`.
2. Agregar/usar tu **módulo** desde la carpeta de infraestructura, llamandolo desde su repo (no copiar el modulo a este repo, deben poner la url de su repo en source).
3. Abrir **Pull Request** y **agregar a _Gonzalo Rodriguez_** como reviewer.
4. La pipeline corre `plan` al abrir el MR. Al aprobar y hacer merge a `main`, corre `apply`.

---


