# [*Linktastic*](http://Linktastic-mmr.herokuapp.com/)

## Descripción

Aplicación clon de [*Hacker News*](http://news.ycombinator.com/), que permite publicar artículos, votar por ellos y enviar notificaciones por email a todos los usuarios registrados en ella.

## Reglas

- Ordenar de más nuevo a más viejo.
- Priorizar el orden por cantidad de votos.

## Pendiente

- Añadir autorización de usuarios
- Crear notificaciones
- Añadir buscador de artículos
- Inicio de sesión con facebook

## Modelo

User
```ruby
:user_has_many :articles
```
---
Article
```ruby
:article belongs_to :user
