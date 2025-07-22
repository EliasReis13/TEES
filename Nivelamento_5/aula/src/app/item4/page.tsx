"use client"

import { useEffect, useState } from "react";
import { getTodos } from "@/service/todos";

export default function Item4() {
    const [todos, setTodos] = useState([]);

    async function obterTarefas() {
        const t = await getTodos();
        setTodos(t);
    }

    useEffect(() => {
        obterTarefas();
    }, []);

    return (
        <div className="p-4 text-white">
            <h2 className="text-xl font-bold mb-4">Tarefas</h2>
            <ul>
                {todos.map((todo: any) => (
                    <li key={todo.id} className="mb-4">
                        <p><strong>Título:</strong> {todo.title}</p>
                        <p><strong>Concluída:</strong> {todo.completed ? "Sim" : "Não"}</p>
                        <hr className="my-2 border-gray-600" />
                    </li>
                ))}
            </ul>
        </div>
    )
}