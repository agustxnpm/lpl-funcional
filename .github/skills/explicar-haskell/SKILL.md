---
name: explicar-haskell
description: "Explicar ejercicios o conceptos de Haskell para principiantes sin rodeos técnicos ni jerga compleja. Usar cuando el usuario pida explicaciones simples, paso a paso, 'para quien no entiende nada de Haskell' o resolución didáctica de ejercicios de paradigmas/funcional."
argument-hint: "[ejercicio o función a explicar]"
user-invocable: true
disable-model-invocation: false
---

# Explicación de Haskell para Principiantes

Esta skill define la estructura y tono pedagógico para explicar cualquier ejercicio de Haskell de este proyecto de manera clara, accesible y sin tecnicismos innecesarios.

## Tono y Enfoque

- **Cero jerga al inicio**: Evitar tecnicismos vacíos como "mónada", "morfismo", "endomorfismo" o definiciones puramente abstractas sin una analogía previa.
- **Empatía didáctica**: Explicar como si le estuvieras contando a un compañero que viene de lenguajes imperativos (Python, C, Java, JS).
- **Enfoque conceptual**: Explicar la intuición del paradigma funcional (inmutabilidad, recursión sobre listas, evaluación perezosa, orden superior).

---

## Estructura de la Respuesta

Cada vez que se explique una función o ejercicio, seguir exactamente este esquema de secciones:

### 1. ¿Qué nos piden o qué hace la función?
- Explicar la idea con palabras sencillas o una analogía cotidiana (ej. colador para `filter`, fotocopiadora con filtro para `map`, acumulador para `fold`).
- Mostrar ejemplos visuales de entrada y salida claros: qué entra `->` qué sale.

### 2. El contraste con otros lenguajes
- Si aplica, contrastar con cómo se resolvería en programación imperativa (bucles `for`/`while`, variables mutables).
- Explicar cómo lo piensa el paradigma funcional en su lugar (recursión, casos base, funciones de orden superior).

### 3. Explicación de la firma de tipos
- Desarmar la firma `nombre :: Tipo1 -> Tipo2 -> Resultado` paso a paso:
  - Qué significa cada parte antes de las flechas (argumentos que recibe).
  - Qué significa lo que está al final (el valor devuelto).
  - Si hay variables de tipo genéricas (`a`, `b`) o typeclasses (`Eq a`, `Ord a`, `Num a`), explicar por qué están ahí con ejemplos concretos.

### 4. Paso a paso de la implementación (Patrones y Guardas)
- **Caso base**: ¿Qué pasa con la lista vacía `[]` o el valor cero? Justificar por qué devuelve ese valor específico (ej. elemento neutro matemático, verdad por vacuidad, etc.).
- **Caso recursivo**:
  - Explicar el desarmado de listas `(x:xs)`: cabeza (`x`) y cola (`xs`).
  - Explicar las guardas `| condicion = ... | otherwise = ...` si se usan, comparándolas con `if / else`.
  - Explicar los operadores clave usados (como `:` para cons, `++` para concatenar, `.` para componer, `$` para aplicar).

### 5. Traza mental / Ejecución paso a paso
- Tomar un ejemplo pequeño (de 3 o 4 elementos) y mostrar la secuencia exacta de expansiones o reducciones que hace Haskell en su cabeza hasta llegar al resultado final.

### 6. Curiosidades o particularidades de Haskell (si aplica)
- Explicar conceptos clave que aparezcan en el ejercicio:
  - **Evaluación perezosa (Lazy evaluation)**: Haskell no evalúa hasta que hace falta (short-circuit, listas infinitas).
  - **Currificación**: Todas las funciones en Haskell toman un solo argumento y devuelven otra función.
  - **Funciones como valores de primera clase**: Pasar funciones como parámetros o devolverlas.
