# todo_provs_riverpod

Praticando Riverpod com este ToDo.

Implementando recursos de cache in async list e outras coisas.

Este projeto le ToDos de uma api utilizando o JsonRestServer.

A versão 01 usa Riverpod com a sintaxe antiga stateProvider, etc.
A versão 02 usa Riverpod com a sintaxe nova dos annotations


# Resumo dos providers em Riverpod

Contem também um resumo que eu fiz sobre providers do Riverpod quando estava estudando e buscarei manter atualizado, sempre quando possível.

[Clique aqui](./lib/app/feature/all_providers/all_providers.md)


# Start

## habilitar build_runner
.../todo_provs_riverpod$ dart run build_runner build -d


## habilitar server
.../todo_provs_riverpod$ cd api
.../todo_provs_riverpod$ jrs run